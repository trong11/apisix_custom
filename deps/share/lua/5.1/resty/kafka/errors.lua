-- Copyright (C) Dejiang Zhu(doujiang24)

-- Reference: https://kafka.apache.org/protocol.html#protocol_error_codes
local _M = {
    [0]     = {msg = 'NONE', retriable = false},
    [-1]    = {msg = 'UNKNOWN_SERVER_ERROR', retriable = false},
    [1]     = {msg = 'OFFSET_OUT_OF_RANGE', retriable = false},
    [2]     = {msg = 'CORRUPT_MESSAGE', retriable = true},
    [3]     = {msg = 'UNKNOWN_TOPIC_OR_PARTITION', retriable = true},
    [4]     = {msg = 'INVALID_FETCH_SIZE', retriable = false},
    [5]     = {msg = 'LEADER_NOT_AVAILABLE', retriable = true},
    [6]     = {msg = 'NOT_LEADER_OR_FOLLOWER', retriable = true},
    [7]     = {msg = 'REQUEST_TIMED_OUT', retriable = true},
    [8]     = {msg = 'BROKER_NOT_AVAILABLE', retriable = false},
    [9]     = {msg = 'REPLICA_NOT_AVAILABLE', retriable = true},
    [10]    = {msg = 'MESSAGE_TOO_LARGE', retriable = false},
    [11]    = {msg = 'STALE_CONTROLLER_EPOCH', retriable = false},
    [12]    = {msg = 'OFFSET_METADATA_TOO_LARGE', retriable = false},
    [13]    = {msg = 'NETWORK_EXCEPTION', retriable = true},
    [14]    = {msg = 'COORDINATOR_LOAD_IN_PROGRESS', retriable = true},
    [15]    = {msg = 'COORDINATOR_NOT_AVAILABLE', retriable = true},
    [16]    = {msg = 'NOT_COORDINATOR', retriable = true},
    [17]    = {msg = 'INVALID_TOPIC_EXCEPTION', retriable = false},
    [18]    = {msg = 'RECORD_LIST_TOO_LARGE', retriable = false},
    [19]    = {msg = 'NOT_ENOUGH_REPLICAS', retriable = true},
    [20]    = {msg = 'NOT_ENOUGH_REPLICAS_AFTER_APPEND', retriable = true},
    [21]    = {msg = 'INVALID_REQUIRED_ACKS', retriable = false},
    [22]    = {msg = 'ILLEGAL_GENERATION', retriable = false},
    [23]    = {msg = 'INCONSISTENT_GROUP_PROTOCOL', retriable = false},
    [24]    = {msg = 'INVALID_GROUP_ID', retriable = false},
    [25]    = {msg = 'UNKNOWN_MEMBER_ID', retriable = false},
    [26]    = {msg = 'INVALID_SESSION_TIMEOUT', retriable = false},
    [27]    = {msg = 'REBALANCE_IN_PROGRESS', retriable = false},
    [28]    = {msg = 'INVALID_COMMIT_OFFSET_SIZE', retriable = false},
    [29]    = {msg = 'TOPIC_AUTHORIZATION_FAILED', retriable = false},
    [30]    = {msg = 'GROUP_AUTHORIZATION_FAILED', retriable = false},
    [31]    = {msg = 'CLUSTER_AUTHORIZATION_FAILED', retriable = false},
    [32]    = {msg = 'INVALID_TIMESTAMP', retriable = false},
    [33]    = {msg = 'UNSUPPORTED_SASL_MECHANISM', retriable = false},
    [34]    = {msg = 'ILLEGAL_SASL_STATE', retriable = false},
    [35]    = {msg = 'UNSUPPORTED_VERSION', retriable = false},
    [36]    = {msg = 'TOPIC_ALREADY_EXISTS', retriable = false},
    [37]    = {msg = 'INVALID_PARTITIONS', retriable = false},
    [38]    = {msg = 'INVALID_REPLICATION_FACTOR', retriable = false},
    [39]    = {msg = 'INVALID_REPLICA_ASSIGNMENT', retriable = false},
    [40]    = {msg = 'INVALID_CONFIG', retriable = false},
    [41]    = {msg = 'NOT_CONTROLLER', retriable = true},
    [42]    = {msg = 'INVALID_REQUEST', retriable = false},
    [43]    = {msg = 'UNSUPPORTED_FOR_MESSAGE_FORMAT', retriable = false},
    [44]    = {msg = 'POLICY_VIOLATION', retriable = false},
    [45]    = {msg = 'OUT_OF_ORDER_SEQUENCE_NUMBER', retriable = false},
    [46]    = {msg = 'DUPLICATE_SEQUENCE_NUMBER', retriable = false},
    [47]    = {msg = 'INVALID_PRODUCER_EPOCH', retriable = false},
    [48]    = {msg = 'INVALID_TXN_STATE', retriable = false},
    [49]    = {msg = 'INVALID_PRODUCER_ID_MAPPING', retriable = false},
    [50]    = {msg = 'INVALID_TRANSACTION_TIMEOUT', retriable = false},
    [51]    = {msg = 'CONCURRENT_TRANSACTIONS', retriable = false},
    [52]    = {msg = 'TRANSACTION_COORDINATOR_FENCED', retriable = false},
    [53]    = {msg = 'TRANSACTIONAL_ID_AUTHORIZATION_FAILED', retriable = false},
    [54]    = {msg = 'SECURITY_DISABLED', retriable = false},
    [55]    = {msg = 'OPERATION_NOT_ATTEMPTED', retriable = false},
    [56]    = {msg = 'KAFKA_STORAGE_ERROR', retriable = true},
    [57]    = {msg = 'LOG_DIR_NOT_FOUND', retriable = false},
    [58]    = {msg = 'SASL_AUTHENTICATION_FAILED', retriable = false},
    [59]    = {msg = 'UNKNOWN_PRODUCER_ID', retriable = false},
    [60]    = {msg = 'REASSIGNMENT_IN_PROGRESS', retriable = false},
    [61]    = {msg = 'DELEGATION_TOKEN_AUTH_DISABLED', retriable = false},
    [62]    = {msg = 'DELEGATION_TOKEN_NOT_FOUND', retriable = false},
    [63]    = {msg = 'DELEGATION_TOKEN_OWNER_MISMATCH', retriable = false},
    [64]    = {msg = 'DELEGATION_TOKEN_REQUEST_NOT_ALLOWED', retriable = false},
    [65]    = {msg = 'DELEGATION_TOKEN_AUTHORIZATION_FAILED', retriable = false},
    [66]    = {msg = 'DELEGATION_TOKEN_EXPIRED', retriable = false},
    [67]    = {msg = 'INVALID_PRINCIPAL_TYPE', retriable = false},
    [68]    = {msg = 'NON_EMPTY_GROUP', retriable = false},
    [69]    = {msg = 'GROUP_ID_NOT_FOUND', retriable = false},
    [70]    = {msg = 'FETCH_SESSION_ID_NOT_FOUND', retriable = true},
    [71]    = {msg = 'INVALID_FETCH_SESSION_EPOCH', retriable = true},
    [72]    = {msg = 'LISTENER_NOT_FOUND', retriable = true},
    [73]    = {msg = 'TOPIC_DELETION_DISABLED', retriable = false},
    [74]    = {msg = 'FENCED_LEADER_EPOCH', retriable = true},
    [75]    = {msg = 'UNKNOWN_LEADER_EPOCH', retriable = true},
    [76]    = {msg = 'UNSUPPORTED_COMPRESSION_TYPE', retriable = false},
    [77]    = {msg = 'STALE_BROKER_EPOCH', retriable = false},
    [78]    = {msg = 'OFFSET_NOT_AVAILABLE', retriable = true},
    [79]    = {msg = 'MEMBER_ID_REQUIRED', retriable = false},
    [80]    = {msg = 'PREFERRED_LEADER_NOT_AVAILABLE', retriable = true},
    [81]    = {msg = 'GROUP_MAX_SIZE_REACHED', retriable = false},
    [82]    = {msg = 'FENCED_INSTANCE_ID', retriable = false},
    [83]    = {msg = 'ELIGIBLE_LEADERS_NOT_AVAILABLE', retriable = true},
    [84]    = {msg = 'ELECTION_NOT_NEEDED', retriable = true},
    [85]    = {msg = 'NO_REASSIGNMENT_IN_PROGRESS', retriable = false},
    [86]    = {msg = 'GROUP_SUBSCRIBED_TO_TOPIC', retriable = false},
    [87]    = {msg = 'INVALID_RECORD', retriable = false},
    [88]    = {msg = 'UNSTABLE_OFFSET_COMMIT', retriable = true},
    [89]    = {msg = 'THROTTLING_QUOTA_EXCEEDED', retriable = true},
    [90]    = {msg = 'PRODUCER_FENCED', retriable = false},
    [91]    = {msg = 'RESOURCE_NOT_FOUND', retriable = false},
    [92]    = {msg = 'DUPLICATE_RESOURCE', retriable = false},
    [93]    = {msg = 'UNACCEPTABLE_CREDENTIAL', retriable = false},
    [94]    = {msg = 'INCONSISTENT_VOTER_SET', retriable = false},
    [95]    = {msg = 'INVALID_UPDATE_VERSION', retriable = false},
    [96]    = {msg = 'FEATURE_UPDATE_FAILED', retriable = false},
    [97]    = {msg = 'PRINCIPAL_DESERIALIZATION_FAILURE', retriable = false},
    [98]    = {msg = 'SNAPSHOT_NOT_FOUND', retriable = false},
    [99]    = {msg = 'POSITION_OUT_OF_RANGE', retriable = false},
    [100]   = {msg = 'UNKNOWN_TOPIC_ID', retriable = true},
    [101]   = {msg = 'DUPLICATE_BROKER_REGISTRATION', retriable = false},
    [102]   = {msg = 'BROKER_ID_NOT_REGISTERED', retriable = false},
    [103]   = {msg = 'INCONSISTENT_TOPIC_ID', retriable = true},
    [104]   = {msg = 'INCONSISTENT_CLUSTER_ID', retriable = false},
    [105]   = {msg = 'TRANSACTIONAL_ID_NOT_FOUND', retriable = false},
    [106]   = {msg = 'FETCH_SESSION_TOPIC_ID_ERROR', retriable = true},
}


return _M
