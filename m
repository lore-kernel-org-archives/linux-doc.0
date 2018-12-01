Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BE2E87D089
	for <lwn-linux-doc@archive.lwn.net>; Sat,  1 Dec 2018 00:52:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbeLAMDz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 1 Dec 2018 07:03:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53719 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbeLAMDz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Dec 2018 07:03:55 -0500
Received: by mail-wm1-f68.google.com with SMTP id y1so611096wmi.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Nov 2018 16:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B29QMoiTbSpxY3Fa4t5Cs1UxN7vNMU1quyphzpVawB4=;
        b=hqP5KMeh6iczy2Titx2RnXJe7KMwkxds4PCh7cerMu2UsvyKNKkCKOjdPyAzQMPc9x
         ykzd5IPEorMDp05pB3aTIUn0U2IdGvn/ApoQWEMWYqijtEL1WJGIgD6/Msamo/XuoVxK
         wrHnlKL92IOuCTOv+odnxSifYiz9fzI2JlmTqXctTWaXigYsni2IMF4mk+dD8NekGxs8
         uTtukYHz8xkH5TNyOEJZ8tOjvqkYyG3elUEH7iB3y5rUDzcLZL4SjF6wE+b0cOHDaUaM
         AWHfEFdWoIPM+XQVjEnnt55JBAvIUGF3b+sd1x8xXq9p1sTBRSZ5cKriNhxzkEdui22T
         o26Q==
X-Gm-Message-State: AA+aEWYGjvCkIupiX0hYb7HoxFJOFLDYsd2VpddKNFVI0VrU0eQoYaou
        y0Os5fu89+kapRRwjkxQmvN4pjxXUY4=
X-Google-Smtp-Source: AFSGD/UzBccjPVzw7TPNCZVjTCP2on6m7joGhFymby6P5estYJy3aN8sSOtBZCG5iLb4J4SDwZWSag==
X-Received: by 2002:a1c:7e8e:: with SMTP id z136mr844524wmc.140.1543625561144;
        Fri, 30 Nov 2018 16:52:41 -0800 (PST)
Received: from raver.teknoraver.net (net-93-66-170-114.cust.vodafonedsl.it. [93.66.170.114])
        by smtp.gmail.com with ESMTPSA id h131sm961727wmd.17.2018.11.30.16.52.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Nov 2018 16:52:40 -0800 (PST)
From:   Matteo Croce <mcroce@redhat.com>
To:     linux-doc@vger.kernel.org
Subject: [RFC] Documentation: use RFC 5735 subnet for examples
Date:   Sat,  1 Dec 2018 01:52:39 +0100
Message-Id: <20181201005239.27471-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RFC 5735 defines this subnets for documentation and example code:

  192.0.2.0/24 as TEST-NET-1
  198.51.100.0/24 as TEST-NET-2
  203.0.113.0/24 as TEST-NET-3

Replace where possible the IP addresses in the documentation with
addresses belonging to the test subnets.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 Documentation/ABI/testing/sysfs-bus-rbd    | 2 +-
 Documentation/admin-guide/LSM/Smack.rst    | 4 ++--
 Documentation/dev-tools/kgdb.rst           | 2 +-
 Documentation/filesystems/nfs/nfs-rdma.txt | 4 ++--
 Documentation/isdn/README.HiSax            | 4 ++--
 Documentation/networking/batman-adv.rst    | 6 +++---
 Documentation/networking/cops.txt          | 2 +-
 Documentation/networking/l2tp.txt          | 6 +++---
 Documentation/networking/multiqueue.txt    | 4 ++--
 Documentation/networking/net_failover.rst  | 2 +-
 Documentation/networking/pktgen.txt        | 6 +++---
 Documentation/networking/switchdev.txt     | 4 ++--
 12 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-rbd b/Documentation/ABI/testing/sysfs-bus-rbd
index cc30bee8b5f4..82e6a942c274 100644
--- a/Documentation/ABI/testing/sysfs-bus-rbd
+++ b/Documentation/ABI/testing/sysfs-bus-rbd
@@ -7,7 +7,7 @@ Description:
 
 		Usage: <mon ip addr> <options> <pool name> <rbd image name> [<snap name>]
 
-		 $ echo "192.168.0.1 name=admin rbd foo" > /sys/bus/rbd/add
+		 $ echo "192.0.2.1 name=admin rbd foo" > /sys/bus/rbd/add
 
 		The snapshot name can be "-" or omitted to map the image
 		read/write. A <dev-id> will be assigned for any registered block
diff --git a/Documentation/admin-guide/LSM/Smack.rst b/Documentation/admin-guide/LSM/Smack.rst
index 6a5826a13aea..0178467cfb9e 100644
--- a/Documentation/admin-guide/LSM/Smack.rst
+++ b/Documentation/admin-guide/LSM/Smack.rst
@@ -723,11 +723,11 @@ If you don't know what CIPSO is and don't plan to use it, you can just do::
 	echo 127.0.0.1 -CIPSO > /sys/fs/smackfs/netlabel
 	echo 0.0.0.0/0 @      > /sys/fs/smackfs/netlabel
 
-If you use CIPSO on your 192.168.0.0/16 local network and need also unlabeled
+If you use CIPSO on your 192.0.2.0/16 local network and need also unlabeled
 Internet access, you can have::
 
 	echo 127.0.0.1      -CIPSO > /sys/fs/smackfs/netlabel
-	echo 192.168.0.0/16 -CIPSO > /sys/fs/smackfs/netlabel
+	echo 192.0.2.0/16 -CIPSO > /sys/fs/smackfs/netlabel
 	echo 0.0.0.0/0      @      > /sys/fs/smackfs/netlabel
 
 Writing Applications for Smack
diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index d38be58f872a..50a7641d13c1 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -541,7 +541,7 @@ Connecting with gdb to a serial port
    Example (kgdb to a terminal server on TCP port 2012)::
 
            % gdb ./vmlinux
-           (gdb) target remote 192.168.2.2:2012
+           (gdb) target remote 192.0.2.2:2012
 
 
    Once connected, you can debug a kernel the way you would debug an
diff --git a/Documentation/filesystems/nfs/nfs-rdma.txt b/Documentation/filesystems/nfs/nfs-rdma.txt
index 22dc0dd6889c..1adb29475d34 100644
--- a/Documentation/filesystems/nfs/nfs-rdma.txt
+++ b/Documentation/filesystems/nfs/nfs-rdma.txt
@@ -214,8 +214,8 @@ NFS/RDMA Setup
 
     Exports entries with the following formats have been tested:
 
-    /vol0   192.168.0.47(fsid=0,rw,async,insecure,no_root_squash)
-    /vol0   192.168.0.0/255.255.255.0(fsid=0,rw,async,insecure,no_root_squash)
+    /vol0   192.0.2.47(fsid=0,rw,async,insecure,no_root_squash)
+    /vol0   192.0.2.0/255.255.255.0(fsid=0,rw,async,insecure,no_root_squash)
 
     The IP address(es) is(are) the client's IPoIB address for an InfiniBand
     HCA or the client's iWARP address(es) for an RNIC.
diff --git a/Documentation/isdn/README.HiSax b/Documentation/isdn/README.HiSax
index b1a573cf4472..0c3a7e0ef80b 100644
--- a/Documentation/isdn/README.HiSax
+++ b/Documentation/isdn/README.HiSax
@@ -584,8 +584,8 @@ I4L_REMOTE_IS_CISCO=no
 I4L_MODULE_PARAMS="type=16 io=0x268 irq=7 "
 I4L_DEBUG=no
 I4L_LEASED_128K=yes
-LOCAL_IP=192.168.1.1
-REMOTE_IP=192.168.2.1
+LOCAL_IP=192.0.2.1
+REMOTE_IP=198.51.100.1
 
 case "$1" in
     start)
diff --git a/Documentation/networking/batman-adv.rst b/Documentation/networking/batman-adv.rst
index 245fb6c0ab6f..7c9bfeed628f 100644
--- a/Documentation/networking/batman-adv.rst
+++ b/Documentation/networking/batman-adv.rst
@@ -118,11 +118,11 @@ IP address which can be either statically configured or dynamically (by using
 DHCP or similar services)::
 
   NodeA: ip link set up dev bat0
-  NodeA: ip addr add 192.168.0.1/24 dev bat0
+  NodeA: ip addr add 192.0.2.1/24 dev bat0
 
   NodeB: ip link set up dev bat0
-  NodeB: ip addr add 192.168.0.2/24 dev bat0
-  NodeB: ping 192.168.0.1
+  NodeB: ip addr add 192.0.2.2/24 dev bat0
+  NodeB: ping 192.0.2.1
 
 Note: In order to avoid problems remove all IP addresses previously assigned to
 interfaces now used by batman advanced, e.g.::
diff --git a/Documentation/networking/cops.txt b/Documentation/networking/cops.txt
index 3e344b448e07..daa73cfbffc4 100644
--- a/Documentation/networking/cops.txt
+++ b/Documentation/networking/cops.txt
@@ -39,7 +39,7 @@ Or in lilo.conf put something like this:
 
 Then bring up the interface with ifconfig. It will look something like this:
 lt0       Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-F7-00-00-00-00-00-00-00-00
-          inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0
+          inet addr:192.0.2.2  Bcast:192.0.2.255  Mask:255.255.255.0
           UP BROADCAST RUNNING NOARP MULTICAST  MTU:600  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0 coll:0
diff --git a/Documentation/networking/l2tp.txt b/Documentation/networking/l2tp.txt
index 9bc271cdc9a8..6d6cc03e08d0 100644
--- a/Documentation/networking/l2tp.txt
+++ b/Documentation/networking/l2tp.txt
@@ -209,12 +209,12 @@ tunnels, where there is no L2TP control protocol; tunnels are
 configured at each side manually. New commands are available in
 iproute2's ip utility to support this.
 
-To create an L2TPv3 ethernet pseudowire between local host 192.168.1.1
-and peer 192.168.1.2, using IP addresses 10.5.1.1 and 10.5.1.2 for the
+To create an L2TPv3 ethernet pseudowire between local host 192.0.2.1
+and peer 192.0.2.2, using IP addresses 10.5.1.1 and 10.5.1.2 for the
 tunnel endpoints:-
 
 # ip l2tp add tunnel tunnel_id 1 peer_tunnel_id 1 udp_sport 5000 \
-  udp_dport 5000 encap udp local 192.168.1.1 remote 192.168.1.2
+  udp_dport 5000 encap udp local 192.0.2.1 remote 192.0.2.2
 # ip l2tp add session tunnel_id 1 session_id 1 peer_session_id 1
 # ip -s -d show dev l2tpeth0
 # ip addr add 10.5.1.2/32 peer 10.5.1.1/32 dev l2tpeth0
diff --git a/Documentation/networking/multiqueue.txt b/Documentation/networking/multiqueue.txt
index 4caa0e314cc2..2d4488d7ada8 100644
--- a/Documentation/networking/multiqueue.txt
+++ b/Documentation/networking/multiqueue.txt
@@ -68,11 +68,11 @@ function or based on netdev->select_queue() if you have it defined.
 
 The behavior of tc filters remains the same.  However a new tc action,
 skbedit, has been added.  Assuming you wanted to route all traffic to a
-specific host, for example 192.168.0.3, through a specific queue you could use
+specific host, for example 192.0.2.3, through a specific queue you could use
 this action and establish a filter such as:
 
 tc filter add dev eth0 parent 1: protocol ip prio 1 u32 \
-	match ip dst 192.168.0.3 \
+	match ip dst 192.0.2.3 \
 	action skbedit queue_mapping 3
 
 Author: Alexander Duyck <alexander.h.duyck@intel.com>
diff --git a/Documentation/networking/net_failover.rst b/Documentation/networking/net_failover.rst
index 06c97dcb57ca..302ad3a0db4c 100644
--- a/Documentation/networking/net_failover.rst
+++ b/Documentation/networking/net_failover.rst
@@ -61,7 +61,7 @@ netdevs created in the VM.
 
   4: ens10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
       link/ether 52:54:00:00:12:53 brd ff:ff:ff:ff:ff:ff
-      inet 192.168.12.53/24 brd 192.168.12.255 scope global dynamic ens10
+      inet 192.0.2.53/24 brd 192.0.2.255 scope global dynamic ens10
          valid_lft 42482sec preferred_lft 42482sec
       inet6 fe80::97d8:db2:8c10:b6d6/64 scope link
          valid_lft forever preferred_lft forever
diff --git a/Documentation/networking/pktgen.txt b/Documentation/networking/pktgen.txt
index d2fd78f85aa4..eaed029ebf8e 100644
--- a/Documentation/networking/pktgen.txt
+++ b/Documentation/networking/pktgen.txt
@@ -91,7 +91,7 @@ interruption.  Example:
      frags: 0  delay: 0  clone_skb: 64  ifname: eth4@0
      flows: 0 flowlen: 0
      queue_map_min: 0  queue_map_max: 0
-     dst_min: 192.168.81.2  dst_max:
+     dst_min: 192.0.2.2  dst_max:
      src_min:   src_max:
      src_mac: 90:e2:ba:0a:56:b4 dst_mac: 00:1b:21:3c:9d:f8
      udp_src_min: 9  udp_src_max: 109  udp_dst_min: 9  udp_dst_max: 9
@@ -101,7 +101,7 @@ interruption.  Example:
      pkts-sofar: 100000  errors: 0
      started: 623913381008us  stopped: 623913396439us idle: 25us
      seq_num: 100001  cur_dst_mac_offset: 0  cur_src_mac_offset: 0
-     cur_saddr: 192.168.8.3  cur_daddr: 192.168.81.2
+     cur_saddr: 198.51.100.3  cur_daddr: 192.0.2.2
      cur_udp_dst: 9  cur_udp_src: 42
      cur_queue_map: 0
      flows: 0
@@ -233,7 +233,7 @@ samples/pktgen directory. The helper parameters.sh file support easy
 and consistent parameter parsing across the sample scripts.
 
 Usage example and help:
- ./pktgen_sample01_simple.sh -i eth4 -m 00:1B:21:3C:9D:F8 -d 192.168.8.2
+ ./pktgen_sample01_simple.sh -i eth4 -m 00:1B:21:3C:9D:F8 -d 198.51.100.2
 
 Usage: ./pktgen_sample01_simple.sh [-vx] -i ethX
   -i : ($DEV)       output interface/device (required)
diff --git a/Documentation/networking/switchdev.txt b/Documentation/networking/switchdev.txt
index 82236a17b5e6..e2dbdb467651 100644
--- a/Documentation/networking/switchdev.txt
+++ b/Documentation/networking/switchdev.txt
@@ -342,7 +342,7 @@ Routes offloaded to the device are labeled with "offload" in the ip route
 listing:
 
 	$ ip route show
-	default via 192.168.0.2 dev eth0
+	default via 192.0.2.2 dev eth0
 	11.0.0.0/30 dev sw1p1  proto kernel  scope link  src 11.0.0.2 offload
 	11.0.0.4/30 via 11.0.0.1 dev sw1p1  proto zebra  metric 20 offload
 	11.0.0.8/30 dev sw1p2  proto kernel  scope link  src 11.0.0.10 offload
@@ -352,7 +352,7 @@ listing:
 		nexthop via 11.0.0.9  dev sw1p2 weight 1
 	12.0.0.3 via 11.0.0.1 dev sw1p1  proto zebra  metric 20 offload
 	12.0.0.4 via 11.0.0.9 dev sw1p2  proto zebra  metric 20 offload
-	192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.15
+	192.0.2.0/24 dev eth0  proto kernel  scope link  src 192.0.2.15
 
 The "offload" flag is set in case at least one device offloads the FIB entry.
 
-- 
2.19.1

