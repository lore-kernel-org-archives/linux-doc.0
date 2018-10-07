Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 314DD7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun,  7 Oct 2018 08:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbeJGQDE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 7 Oct 2018 12:03:04 -0400
Received: from mx1.arthurfabre.com ([178.33.183.242]:56342 "EHLO
        mx1.arthurfabre.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbeJGQDD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 7 Oct 2018 12:03:03 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Sun, 07 Oct 2018 12:03:01 EDT
Received: from localhost (localhost [IPv6:::1])
        by mx1.arthurfabre.com (Postfix) with ESMTP id A8752480BFA;
        Sun,  7 Oct 2018 08:50:21 +0000 (GMT)
Received: from mx1.arthurfabre.com ([IPv6:::1])
        by localhost (mx1.arthurfabre.com [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id oxYhw_Q13X4A; Sun,  7 Oct 2018 08:50:21 +0000 (GMT)
Received: from localhost (localhost [IPv6:::1])
        by mx1.arthurfabre.com (Postfix) with ESMTP id ED012480BF7;
        Sun,  7 Oct 2018 08:50:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx1.arthurfabre.com ED012480BF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arthurfabre.com;
        s=DFDA07C6-67B5-11E5-9A84-63B9AD7B0097; t=1538902221;
        bh=60jbeHEvkDYhWpzAW1E3AYJGwdVm99VDZ2hjDpksTy4=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=AeWgltm433EYWUjbY8SPID2m1LYgYamH9PykZNjweJCswUEc1gwwYWzfmQ4erwDVE
         vjnDObrP7dNxYpSa+uoXdDp+H+/dh35zFVxe11x6b1SaZNGuteNhKy4VxobRNE4xwX
         uEtgBeJ03TDxb/SDziNPXxNz3DMblhhk0BklZd/l6MOAhs+M6wZ0Nqo3kfOTcEvTS4
         aDkzxNYxMahUj4sdWeEsBIFm5JenWrf/m6T7O2nddRBaUcsaa+kV8ZMOqICdtCLwSl
         S2T0M3PWfaVaic2KBYqfT/+sZCz6oZOYIN1ZE0KIL5KMHl+ii+Moxzjhd1Co7vGeT+
         yt5v50X4YLypQ==
Received: from mx1.arthurfabre.com ([IPv6:::1])
        by localhost (mx1.arthurfabre.com [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id coryO_j7F85d; Sun,  7 Oct 2018 08:50:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [90.194.101.9])
        by mx1.arthurfabre.com (Postfix) with ESMTPSA id 7625C480BF1;
        Sun,  7 Oct 2018 08:50:20 +0000 (GMT)
From:   Arthur Fabre <arthur@arthurfabre.com>
To:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Arthur Fabre <arthur@arthurfabre.com>
Subject: [PATCH] bpf, doc: Document Jump X addressing mode
Date:   Sun,  7 Oct 2018 09:45:19 +0100
Message-Id: <20181007084519.27445-1-arthur@arthurfabre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

bpf_asm and the other classic BPF tools support jump conditions
comparing register A to register X, in addition to comparing register A
with constant K.
Only the latter was documented in filter.txt, add two new addressing
modes that describe the former.

Signed-off-by: Arthur Fabre <arthur@arthurfabre.com>
---
 Documentation/networking/filter.txt | 30 +++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/Documentation/networking/filter.txt b/Documentation/networki=
ng/filter.txt
index e6b4ebb2b243..b90dad6fea6d 100644
--- a/Documentation/networking/filter.txt
+++ b/Documentation/networking/filter.txt
@@ -203,11 +203,11 @@ opcodes as defined in linux/filter.h stand for:
=20
   Instruction      Addressing mode      Description
=20
-  ld               1, 2, 3, 4, 10       Load word into A
+  ld               1, 2, 3, 4, 12       Load word into A
   ldi              4                    Load word into A
   ldh              1, 2                 Load half-word into A
   ldb              1, 2                 Load byte into A
-  ldx              3, 4, 5, 10          Load word into X
+  ldx              3, 4, 5, 12          Load word into X
   ldxi             4                    Load word into X
   ldxb             5                    Load byte into X
=20
@@ -216,14 +216,14 @@ opcodes as defined in linux/filter.h stand for:
=20
   jmp              6                    Jump to label
   ja               6                    Jump to label
-  jeq              7, 8                 Jump on A =3D=3D k
-  jneq             8                    Jump on A !=3D k
-  jne              8                    Jump on A !=3D k
-  jlt              8                    Jump on A <  k
-  jle              8                    Jump on A <=3D k
-  jgt              7, 8                 Jump on A >  k
-  jge              7, 8                 Jump on A >=3D k
-  jset             7, 8                 Jump on A &  k
+  jeq              7, 8, 9, 10          Jump on A =3D=3D <x>
+  jneq             9, 10                Jump on A !=3D <x>
+  jne              9, 10                Jump on A !=3D <x>
+  jlt              9, 10                Jump on A <  <x>
+  jle              9, 10                Jump on A <=3D <x>
+  jgt              7, 8, 9, 10          Jump on A >  <x>
+  jge              7, 8, 9, 10          Jump on A >=3D <x>
+  jset             7, 8, 9, 10          Jump on A &  <x>
=20
   add              0, 4                 A + <x>
   sub              0, 4                 A - <x>
@@ -240,7 +240,7 @@ opcodes as defined in linux/filter.h stand for:
   tax                                   Copy A into X
   txa                                   Copy X into A
=20
-  ret              4, 9                 Return
+  ret              4, 11                Return
=20
 The next table shows addressing formats from the 2nd column:
=20
@@ -254,9 +254,11 @@ The next table shows addressing formats from the 2nd=
 column:
    5               4*([k]&0xf)          Lower nibble * 4 at byte offset =
k in the packet
    6               L                    Jump label L
    7               #k,Lt,Lf             Jump to Lt if true, otherwise ju=
mp to Lf
-   8               #k,Lt                Jump to Lt if predicate is true
-   9               a/%a                 Accumulator A
-  10               extension            BPF extension
+   8               x/%x,Lt,Lf           Jump to Lt if true, otherwise ju=
mp to Lf
+   9               #k,Lt                Jump to Lt if predicate is true
+  10               x/%x,Lt              Jump to Lt if predicate is true
+  11               a/%a                 Accumulator A
+  12               extension            BPF extension
=20
 The Linux kernel also has a couple of BPF extensions that are used along
 with the class of load instructions by "overloading" the k argument with
--=20
2.19.1

