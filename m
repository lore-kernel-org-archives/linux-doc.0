Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AAE17D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Jan 2019 13:42:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732749AbfAKNlH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Jan 2019 08:41:07 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42335 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731147AbfAKNlH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jan 2019 08:41:07 -0500
Received: by mail-ed1-f67.google.com with SMTP id y20so13105236edw.9
        for <linux-doc@vger.kernel.org>; Fri, 11 Jan 2019 05:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lgx8qN5/ClfwRURmnecKs3R0HNWtmSbJ2awJbDvzByM=;
        b=CfmANB18ib7O1BP5W4WI+0NQaOuT0b+3kfvhmkcivkgO26Hu9Ce9PKE+f+CRxvuSti
         nTRBnrFTLblfXLZ/yxT9CYrMRz9GElmNwKFJyrXvkd5EEY0in24O0I5NS85SheIryGcK
         e+jqmvEJtuccRphZO9PQweRc+y3YaBb47IEIqVSpJ3tqeY7azLUxqIR3mWldwwHelRDH
         StbOebz68PVc5/2uGaMbZqLmsfSXlVYoa9cXZitya5BsFHls6u5b/vsp2SldQei9xwa1
         WMoijG966+FhRcdhXbjE7wFVlxUfQJzgKK0ikj9D66bM6b4aq2pdqJKJnUkDi3TGYUvZ
         ud9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lgx8qN5/ClfwRURmnecKs3R0HNWtmSbJ2awJbDvzByM=;
        b=McKPCrNqMN1UPuXNCrRV6rPP3S0S/mpamZPSKGpiMsYMBFCp0SGOwGtRAn0D9Ckydz
         EoieXFilx8ijuwKhJdgR3D6xEDyOX5574HEdS006JiC8FY3ztOZ/IBebTDiLG1MhznFk
         5u/W7yHkW8sR1wCKxJqecnhdc3OknqO9qY4JWePMRIxGmfGD4+fbTV/IS+QN9a+yvQzU
         LN6cVqN6Ix0mI97QPrx2BKvUkIy9ND03r2MvwOPRCfVD79BeGVLv9hY7lWmMnLmYVk77
         MuGKer3I0kLJUbTfC9Wl96PNUnsY1Tv9+BzOJ3IOznvPCnE52FmWch0EsGsa7KZoycfR
         fXLQ==
X-Gm-Message-State: AJcUukfYwONI140+e/8aYfVs1zR35//wYiuvpaACDaFLqQgBDB1DqXLl
        tW32rSnJ9+CwHbOIwCn7wHsTQA==
X-Google-Smtp-Source: ALg8bN5QbksTRLB7THrRv5GUUekOSWOGsSehtyhFdJCi2I/v8oYTbtYDafV9It1YKGdl1x9l3A3FRA==
X-Received: by 2002:a50:aa68:: with SMTP id p37mr12994063edc.168.1547214065195;
        Fri, 11 Jan 2019 05:41:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:8109:b6c0:d6c:2520:8b:922b:4c43])
        by smtp.gmail.com with ESMTPSA id a38sm2312070edd.44.2019.01.11.05.41.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Jan 2019 05:41:04 -0800 (PST)
From:   Christian Brauner <christian@brauner.io>
To:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Christian Brauner <christian@brauner.io>
Subject: [PATCH v1 1/2] Documentation/filesystems: add binderfs
Date:   Fri, 11 Jan 2019 14:40:59 +0100
Message-Id: <20190111134100.24095-1-christian@brauner.io>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This documents the Android binderfs filesystem used to dynamically add and
remove binder devices that are private to each instance.

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* Changelog */
v1:
- switch from *.txt to *.rst format
---
 Documentation/filesystems/binderfs.rst | 70 ++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/filesystems/binderfs.rst

diff --git a/Documentation/filesystems/binderfs.rst b/Documentation/filesystems/binderfs.rst
new file mode 100644
index 000000000000..74a744b42db7
--- /dev/null
+++ b/Documentation/filesystems/binderfs.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The Android binderfs Filesystem
+===============================
+
+Android binderfs is a filesystem for the Android binder IPC mechanism.  It
+allows to dynamically add and remove binder devices at runtime.  Binder devices
+located in a new binderfs instance are independent of binder devices located in
+other binderfs instances.  Mounting a new binderfs instance makes it possible
+to get a set of private binder devices.
+
+Mounting binderfs
+-----------------
+
+Android binderfs can be mounted with:
+
+::
+
+  mkdir /dev/binderfs
+  mount -t binder binder /dev/binderfs
+
+at which point a new instance of binderfs will show up at ``/dev/binderfs``.
+In a fresh instance of binderfs no binder devices will be present.  There will
+only be a ``binder-control`` device which serves as the request handler for
+binderfs. Mounting another binderfs instance at a different location will
+create a new and separate instance from all other binderfs mounts.  This is
+identical to the behavior of e.g. ``devpts`` and ``tmpfs``. The Android
+binderfs filesystem can be mounted in user namespaces.
+
+Options
+-------
+max
+  binderfs instances can be mounted with a limit on the number of binder
+  devices that can be allocated. The ``max=<count>`` mount option serves as
+  a per-instance limit. If ``max=<count>`` is set then only ``<count>`` number
+  of binder devices can be allocated in this binderfs instance.
+
+Allocating binder Devices
+-------------------------
+
+.. _ioctl: http://man7.org/linux/man-pages/man2/ioctl.2.html
+
+To allocate a new binder device in a binderfs instance a request needs to be
+sent through the ``binder-control`` device node.  A request is sent in the form
+of an `ioctl() <ioctl_>`_.
+
+What a program needs to do is to open the ``binder-control`` device node and
+send a ``BINDER_CTL_ADD`` request to the kernel.  Users of binderfs need to
+tell the kernel which name the new binder device should get.  By default a name
+can only contain up to ``BINDERFS_MAX_NAME`` chars including the terminating
+zero byte.
+
+Once the request is made via an `ioctl() <ioctl_>`_ passing a ``struct
+binder_device`` with the name to the kernel it will allocate a new binder
+device and return the major and minor number of the new device in the struct
+(This is necessary because binderfs allocates a major device number
+dynamically.).  After the `ioctl() <ioctl_>`_ returns there will be a new
+binder device located under /dev/binderfs with the chosen name.
+
+Deleting binder Devices
+-----------------------
+
+.. _unlink: http://man7.org/linux/man-pages/man2/unlink.2.html
+.. _rm: http://man7.org/linux/man-pages/man1/rm.1.html
+
+Binderfs binder devices can be deleted via `unlink() <unlink_>`_.  This means
+that the `rm() <rm_>`_ tool can be used to delete them. Note that the
+``binder-control`` device cannot be deleted since this would make the binderfs
+instance unuseable.  The ``binder-control`` device will be deleted when the
+binderfs instance is unmounted and all references to it have been dropped.
-- 
2.19.1

