Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F2D57D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 12:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbeILRsx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 13:48:53 -0400
Received: from mleia.com ([178.79.152.223]:51076 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726359AbeILRsx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 Sep 2018 13:48:53 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 9C5F741663C;
        Wed, 12 Sep 2018 13:44:29 +0100 (BST)
From:   Vladimir Zapolskiy <vz@mleia.com>
To:     Evgeniy Polyakov <zbr@ioremap.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH] Documentation: filesystems: remove reminiscences of POHMELFS
Date:   Wed, 12 Sep 2018 15:44:19 +0300
Message-Id: <20180912124419.10623-1-vz@mleia.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20180912_134429_660068_8650A914 
X-CRM114-Status: GOOD (  39.80  )
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The POHMELFS filesystem was removed in 2012 by commit 67435319866f8
("staging: pohmelfs: remove drivers/staging/pohmelfs") promising that
a newer version will be included to the kernel, but unfortunately
it didn't happen.

Since likely any delopment of the filesystem is halted, the change removes
the abandoned POHMELFS documentation from the kernel tree.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 Documentation/filesystems/00-INDEX            |   2 -
 .../filesystems/pohmelfs/design_notes.txt     |  72 ------
 Documentation/filesystems/pohmelfs/info.txt   |  99 --------
 .../filesystems/pohmelfs/network_protocol.txt | 227 ------------------
 4 files changed, 400 deletions(-)
 delete mode 100644 Documentation/filesystems/pohmelfs/design_notes.txt
 delete mode 100644 Documentation/filesystems/pohmelfs/info.txt
 delete mode 100644 Documentation/filesystems/pohmelfs/network_protocol.txt

diff --git a/Documentation/filesystems/00-INDEX b/Documentation/filesystems/00-INDEX
index 0937bade1099..a53f20114353 100644
--- a/Documentation/filesystems/00-INDEX
+++ b/Documentation/filesystems/00-INDEX
@@ -101,8 +101,6 @@ omfs.txt
 	- info on the Optimized MPEG FileSystem.
 path-lookup.txt
 	- info on path walking and name lookup locking.
-pohmelfs/
-	- directory containing pohmelfs filesystem documentation.
 porting
 	- various information on filesystem porting.
 proc.txt
diff --git a/Documentation/filesystems/pohmelfs/design_notes.txt b/Documentation/filesystems/pohmelfs/design_notes.txt
deleted file mode 100644
index 106d17fbb05f..000000000000
--- a/Documentation/filesystems/pohmelfs/design_notes.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-POHMELFS: Parallel Optimized Host Message Exchange Layered File System.
-
-		Evgeniy Polyakov <zbr@ioremap.net>
-
-Homepage: http://www.ioremap.net/projects/pohmelfs
-
-POHMELFS first began as a network filesystem with coherent local data and
-metadata caches but is now evolving into a parallel distributed filesystem.
-
-Main features of this FS include:
- * Locally coherent cache for data and metadata with (potentially) byte-range locks.
-	Since all Linux filesystems lock the whole inode during writing, algorithm
-	is very simple and does not use byte-ranges, although they are sent in
-	locking messages.
- * Completely async processing of all events except creation of hard and symbolic
-	links, and rename events.
-	Object creation and data reading and writing are processed asynchronously.
- * Flexible object architecture optimized for network processing.
-	Ability to create long paths to objects and remove arbitrarily huge
-	directories with a single network command.
-	(like removing the whole kernel tree via a single network command).
- * Very high performance.
- * Fast and scalable multithreaded userspace server. Being in userspace it works
-	with any underlying filesystem and still is much faster than async in-kernel NFS one.
- * Client is able to switch between different servers (if one goes down, client
-	automatically reconnects to second and so on).
- * Transactions support. Full failover for all operations.
-	Resending transactions to different servers on timeout or error.
- * Read request (data read, directory listing, lookup requests) balancing between multiple servers.
- * Write requests are replicated to multiple servers and completed only when all of them are acked.
- * Ability to add and/or remove servers from the working set at run-time.
- * Strong authentication and possible data encryption in network channel.
- * Extended attributes support.
-
-POHMELFS is based on transactions, which are potentially long-standing objects that live
-in the client's memory. Each transaction contains all the information needed to process a given
-command (or set of commands, which is frequently used during data writing: single transactions
-can contain creation and data writing commands). Transactions are committed by all the servers
-to which they are sent and, in case of failures, are eventually resent or dropped with an error.
-For example, reading will return an error if no servers are available.
-
-POHMELFS uses a asynchronous approach to data processing. Courtesy of transactions, it is
-possible to detach replies from requests and, if the command requires data to be received, the
-caller sleeps waiting for it. Thus, it is possible to issue multiple read commands to different
-servers and async threads will pick up replies in parallel, find appropriate transactions in the
-system and put the data where it belongs (like the page or inode cache).
-
-The main feature of POHMELFS is writeback data and the metadata cache.
-Only a few non-performance critical operations use the write-through cache and
-are synchronous: hard and symbolic link creation, and object rename. Creation,
-removal of objects and data writing are asynchronous and are sent to
-the server during system writeback. Only one writer at a time is allowed for any
-given inode, which is guarded by an appropriate locking protocol.
-Because of this feature, POHMELFS is extremely fast at metadata intensive
-workloads and can fully utilize the bandwidth to the servers when doing bulk
-data transfers.
-
-POHMELFS clients operate with a working set of servers and are capable of balancing read-only
-operations (like lookups or directory listings) between them according to IO priorities.
-Administrators can add or remove servers from the set at run-time via special commands (described
-in Documentation/filesystems/pohmelfs/info.txt file). Writes are replicated to all servers, which
-are connected with write permission turned on. IO priority and permissions can be changed in
-run-time.
-
-POHMELFS is capable of full data channel encryption and/or strong crypto hashing.
-One can select any kernel supported cipher, encryption mode, hash type and operation mode
-(hmac or digest). It is also possible to use both or neither (default). Crypto configuration
-is checked during mount time and, if the server does not support it, appropriate capabilities
-will be disabled or mount will fail (if 'crypto_fail_unsupported' mount option is specified).
-Crypto performance heavily depends on the number of crypto threads, which asynchronously perform
-crypto operations and send the resulting data to server or submit it up the stack. This number
-can be controlled via a mount option.
diff --git a/Documentation/filesystems/pohmelfs/info.txt b/Documentation/filesystems/pohmelfs/info.txt
deleted file mode 100644
index db2e41393626..000000000000
--- a/Documentation/filesystems/pohmelfs/info.txt
+++ /dev/null
@@ -1,99 +0,0 @@
-POHMELFS usage information.
-
-Mount options.
-All but index, number of crypto threads and maximum IO size can changed via remount.
-
-idx=%u
- Each mountpoint is associated with a special index via this option.
- Administrator can add or remove servers from the given index, so all mounts,
- which were attached to it, are updated.
- Default it is 0.
-
-trans_scan_timeout=%u
- This timeout, expressed in milliseconds, specifies time to scan transaction
- trees looking for stale requests, which have to be resent, or if number of
- retries exceed specified limit, dropped with error.
- Default is 5 seconds.
-
-drop_scan_timeout=%u
- Internal timeout, expressed in milliseconds, which specifies how frequently
- inodes marked to be dropped are freed. It also specifies how frequently
- the system checks that servers have to be added or removed from current working set.
- Default is 1 second.
-
-wait_on_page_timeout=%u
- Number of milliseconds to wait for reply from remote server for data reading command.
- If this timeout is exceeded, reading returns an error.
- Default is 5 seconds.
-
-trans_retries=%u
- This is the number of times that a transaction will be resent to a server that did
- not answer for the last @trans_scan_timeout milliseconds.
- When the number of resends exceeds this limit, the transaction is completed with error.
- Default is 5 resends.
-
-crypto_thread_num=%u
- Number of crypto processing threads. Threads are used both for RX and TX traffic.
- Default is 2, or no threads if crypto operations are not supported.
-
-trans_max_pages=%u
- Maximum number of pages in a single transaction. This parameter also controls
- the number of pages,  allocated for crypto processing (each crypto thread has
- pool of pages, the number of which is equal to 'trans_max_pages'.
- Default is 100 pages.
-
-crypto_fail_unsupported
- If specified, mount will fail if the server does not support requested crypto operations.
- By default mount will disable non-matching crypto operations.
-
-mcache_timeout=%u
- Maximum number of milliseconds to wait for the mcache objects to be processed.
- Mcache includes locks (given lock should be granted by server), attributes (they should be
- fully received in the given timeframe).
- Default is 5 seconds.
-
-Usage examples.
-
-Add server server1.net:1025 into the working set with index $idx
-with appropriate hash algorithm and key file and cipher algorithm, mode and key file:
-$cfg A add -a server1.net -p 1025 -i $idx -K $hash_key -k $cipher_key
-
-Mount filesystem with given index $idx to /mnt mountpoint.
-Client will connect to all servers specified in the working set via previous command:
-mount -t pohmel -o idx=$idx q /mnt
-
-Change permissions to read-only (-I 1 option, '-I 2' - write-only, 3 - rw):
-$cfg A modify -a server1.net -p 1025 -i $idx -I 1
-
-Change IO priority to 123 (node with the highest priority gets read requests).
-$cfg A modify -a server1.net -p 1025 -i $idx -P 123
-
-One can check currect status of all connections in the mountstats file:
-# cat /proc/$PID/mountstats
-...
-device none mounted on /mnt with fstype pohmel
-idx addr(:port) socket_type protocol active priority permissions
-0 server1.net:1026 1 6 1 250 1
-0 server2.net:1025 1 6 1 123 3
-
-Server installation.
-
-Creating a server, which listens at port 1025 and 0.0.0.0 address.
-Working root directory (note, that server chroots there, so you have to have appropriate permissions)
-is set to /mnt, server will negotiate hash/cipher with client, in case client requested it, there
-are appropriate key files.
-Number of working threads is set to 10.
-
-# ./fserver -a 0.0.0.0 -p 1025 -r /mnt -w 10 -K hash_key -k cipher_key
-
- -A 6			 - listen on ipv6 address. Default: Disabled.
- -r root                 - path to root directory. Default: /tmp.
- -a addr                 - listen address. Default: 0.0.0.0.
- -p port                 - listen port. Default: 1025.
- -w workers              - number of workers per connected client. Default: 1.
- -K file		 - hash key size. Default: none.
- -k file		 - cipher key size. Default: none.
- -h                      - this help.
-
-Number of worker threads specifies how many workers will be created for each client.
-Bulk single-client transafers usually are better handled with smaller number (like 1-3).
diff --git a/Documentation/filesystems/pohmelfs/network_protocol.txt b/Documentation/filesystems/pohmelfs/network_protocol.txt
deleted file mode 100644
index c680b4b5353d..000000000000
--- a/Documentation/filesystems/pohmelfs/network_protocol.txt
+++ /dev/null
@@ -1,227 +0,0 @@
-POHMELFS network protocol.
-
-Basic structure used in network communication is following command:
-
-struct netfs_cmd
-{
-	__u16			cmd;	/* Command number */
-	__u16			csize;	/* Attached crypto information size */
-	__u16			cpad;	/* Attached padding size */
-	__u16			ext;	/* External flags */
-	__u32			size;	/* Size of the attached data */
-	__u32			trans;	/* Transaction id */
-	__u64			id;	/* Object ID to operate on. Used for feedback.*/
-	__u64			start;	/* Start of the object. */
-	__u64			iv;	/* IV sequence */
-	__u8			data[0];
-};
-
-Commands can be embedded into transaction command (which in turn has own command),
-so one can extend protocol as needed without breaking backward compatibility as long
-as old commands are supported. All string lengths include tail 0 byte.
-
-All commands are transferred over the network in big-endian. CPU endianness is used at the end peers.
-
-@cmd - command number, which specifies command to be processed. Following
-	commands are used currently:
-
-	NETFS_READDIR	= 1,	/* Read directory for given inode number */
-	NETFS_READ_PAGE,	/* Read data page from the server */
-	NETFS_WRITE_PAGE,	/* Write data page to the server */
-	NETFS_CREATE,		/* Create directory entry */
-	NETFS_REMOVE,		/* Remove directory entry */
-	NETFS_LOOKUP,		/* Lookup single object */
-	NETFS_LINK,		/* Create a link */
-	NETFS_TRANS,		/* Transaction */
-	NETFS_OPEN,		/* Open intent */
-	NETFS_INODE_INFO,	/* Metadata cache coherency synchronization message */
-	NETFS_PAGE_CACHE,	/* Page cache invalidation message */
-	NETFS_READ_PAGES,	/* Read multiple contiguous pages in one go */
-	NETFS_RENAME,		/* Rename object */
-	NETFS_CAPABILITIES,	/* Capabilities of the client, for example supported crypto */
-	NETFS_LOCK,		/* Distributed lock message */
-	NETFS_XATTR_SET,	/* Set extended attribute */
-	NETFS_XATTR_GET,	/* Get extended attribute */
-
-@ext - external flags. Used by different commands to specify some extra arguments
-	like partial size of the embedded objects or creation flags.
-
-@size - size of the attached data. For NETFS_READ_PAGE and NETFS_READ_PAGES no data is attached,
-	but size of the requested data is incorporated here. It does not include size of the command
-	header (struct netfs_cmd) itself.
-
-@id - id of the object this command operates on. Each command can use it for own purpose.
-
-@start - start of the object this command operates on. Each command can use it for own purpose.
-
-@csize, @cpad - size and padding size of the (attached if needed) crypto information.
-
-Command specifications.
-
-@NETFS_READDIR
-This command is used to sync content of the remote dir to the client.
-
-@ext - length of the path to object.
-@size - the same.
-@id - local inode number of the directory to read.
-@start - zero.
-
-
-@NETFS_READ_PAGE
-This command is used to read data from remote server.
-Data size does not exceed local page cache size.
-
-@id - inode number.
-@start - first byte offset.
-@size - number of bytes to read plus length of the path to object.
-@ext - object path length.
-
-
-@NETFS_CREATE
-Used to create object.
-It does not require that all directories on top of the object were
-already created, it will create them automatically. Each object has
-associated @netfs_path_entry data structure, which contains creation
-mode (permissions and type) and length of the name as long as name itself.
-
-@start - 0
-@size - size of the all data structures needed to create a path
-@id - local inode number
-@ext - 0
-
-
-@NETFS_REMOVE
-Used to remove object.
-
-@ext - length of the path to object.
-@size - the same.
-@id - local inode number.
-@start - zero.
-
-
-@NETFS_LOOKUP
-Lookup information about object on server.
-
-@ext - length of the path to object.
-@size - the same.
-@id - local inode number of the directory to look object in.
-@start - local inode number of the object to look at.
-
-
-@NETFS_LINK
-Create hard of symlink.
-Command is sent as "object_path|target_path".
-
-@size - size of the above string.
-@id - parent local inode number.
-@start - 1 for symlink, 0 for hardlink.
-@ext - size of the "object_path" above.
-
-
-@NETFS_TRANS
-Transaction header.
-
-@size - incorporates all embedded command sizes including theirs header sizes.
-@start - transaction generation number - unique id used to find transaction.
-@ext - transaction flags. Unused at the moment.
-@id - 0.
-
-
-@NETFS_OPEN
-Open intent for given transaction.
-
-@id - local inode number.
-@start - 0.
-@size - path length to the object.
-@ext - open flags (O_RDWR and so on).
-
-
-@NETFS_INODE_INFO
-Metadata update command.
-It is sent to servers when attributes of the object are changed and received
-when data or metadata were updated. It operates with the following structure:
-
-struct netfs_inode_info
-{
-	unsigned int		mode;
-	unsigned int		nlink;
-	unsigned int		uid;
-	unsigned int		gid;
-	unsigned int		blocksize;
-	unsigned int		padding;
-	__u64			ino;
-	__u64			blocks;
-	__u64			rdev;
-	__u64			size;
-	__u64			version;
-};
-
-It effectively mirrors stat(2) returned data.
-
-
-@ext - path length to the object.
-@size - the same plus size of the netfs_inode_info structure.
-@id - local inode number.
-@start - 0.
-
-
-@NETFS_PAGE_CACHE
-Command is only received by clients. It contains information about
-page to be marked as not up-to-date.
-
-@id - client's inode number.
-@start - last byte of the page to be invalidated. If it is not equal to
-	current inode size, it will be vmtruncated().
-@size - 0
-@ext - 0
-
-
-@NETFS_READ_PAGES
-Used to read multiple contiguous pages in one go.
-
-@start - first byte of the contiguous region to read.
-@size - contains of two fields: lower 8 bits are used to represent page cache shift
-	used by client, another 3 bytes are used to get number of pages.
-@id - local inode number.
-@ext - path length to the object.
-
-
-@NETFS_RENAME
-Used to rename object.
-Attached data is formed into following string: "old_path|new_path".
-
-@id - local inode number.
-@start - parent inode number.
-@size - length of the above string.
-@ext - length of the old path part.
-
-
-@NETFS_CAPABILITIES
-Used to exchange crypto capabilities with server.
-If crypto capabilities are not supported by server, then client will disable it
-or fail (if 'crypto_fail_unsupported' mount options was specified).
-
-@id - superblock index. Used to specify crypto information for group of servers.
-@size - size of the attached capabilities structure.
-@start - 0.
-@size - 0.
-@scsize - 0.
-
-@NETFS_LOCK
-Used to send lock request/release messages. Although it sends byte range request
-and is capable of flushing pages based on that, it is not used, since all Linux
-filesystems lock the whole inode.
-
-@id - lock generation number.
-@start - start of the locked range.
-@size - size of the locked range.
-@ext - lock type: read/write. Not used actually. 15'th bit is used to determine,
-	if it is lock request (1) or release (0).
-
-@NETFS_XATTR_SET
-@NETFS_XATTR_GET
-Used to set/get extended attributes for given inode.
-@id - attribute generation number or xattr setting type
-@start - size of the attribute (request or attached)
-@size - name length, path len and data size for given attribute
-@ext - path length for given object
-- 
2.17.1

