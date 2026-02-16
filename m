Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5932D5C91
	for <linux-doc@vger.kernel.org>; Mon, 16 Feb 2026 16:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771259516; cv=none; b=Udxv8YIVWpFWrjxO/HtAcKFY1291r06zeWNZ3KuFaNz+pnjODu9NRVUBnmhVUvYBjksTqSx01Sj32o5aRWkk7YjGdnpFXIYqit0gB6Y6ionIFUMMuEslNGR8bRq/G58vzShUH3sdWcqFUVprdL/73M7ta1tDl2FEvaHhOtrlFw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771259516; c=relaxed/simple;
	bh=+7SJriHApn6LG+ZXkqk+hATTXuG4ofS1EC6EC19EIdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7EQlNJVramk8JuRjsxDS1ptYDh8hPFF+Xm/4Zoapq/sRbMBNtozAbNRG4o6KBg3mIGpR6pliXNXLPFnGwnoPIZgAUfTX6Gha/bRgUMagrC3iPf6uWckh9GqEZAR81K7IKPNcMHD+ctdQ08cglAlYTbVFanIsGwjbZtyfjYFt28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J4/Wu1F9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LYzmf9MY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J4/Wu1F9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LYzmf9MY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771259514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WkePnEG/Jhpv0IH/ZRAVd0v+S4IAU+eMmwXDSi6Vcco=;
	b=J4/Wu1F9wVu2yX4rsijlKdto7w6bTtmtzpeGvmooFJy5QxRJInVqNeWYp8uy8K+7+K37ct
	rXjE/C2XN0ZPVsHmGp7fE3eRGcHUC0YC6in23STr2tojP7+IWfSF2LjFqe1CMwUVdabFv3
	38XMwgOqUmUIQupECfPssSC27IgBWyU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-LzFQg96mNn2eWJO7V3jliw-1; Mon, 16 Feb 2026 11:31:51 -0500
X-MC-Unique: LzFQg96mNn2eWJO7V3jliw-1
X-Mimecast-MFC-AGG-ID: LzFQg96mNn2eWJO7V3jliw_1771259510
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4368060a5e5so3758659f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Feb 2026 08:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771259510; x=1771864310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WkePnEG/Jhpv0IH/ZRAVd0v+S4IAU+eMmwXDSi6Vcco=;
        b=LYzmf9MYdRl68p3q3NiyszCoOfUO0iS+htceNaZHzBzOqgU6vUDXyF+H3gglv14cIl
         Imw+BNpqTnknK0QMQ50ylleOFkoukReTm6i+5wfPWKKzrq8DQ/e+bH8ha/n8Xw0cBFuk
         e2rQuN2F+rSuSFpUwzppQw4jtw/OC6IMgaxNzyM8XrDahLlO/FlJEf3sqyh1PPvAzroD
         NfV7VwT3Ky9jcMco6wVHwdOjmYIzArJY15/G5CnyoWQz9FgXu9aiFB005fYtrHPgxiVw
         PQlizuCxRnFcUun3penpsFkDoTRpwiPqoSzh9/q8ID3E7PS3dU71yV4TFqGSTuXNxU4L
         vf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259510; x=1771864310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkePnEG/Jhpv0IH/ZRAVd0v+S4IAU+eMmwXDSi6Vcco=;
        b=DZTEDynvEjRz6ULsavxxelCIXIEkIhqLVyr6HnYl6DWLtLJvT4EXITvYrovzfYDmY0
         SV7PsHqMUc7+UbEXSm+4/IbEmYJMAwQTEnpnubxVCFXSBuVPlmY+LcUaw2iAERShME+2
         jUgYKfVEOk5vDZyqERzmOpPwc6t+0ZvIUTPlcrvPLmM6vNp3fgVo69EB0Cv4Vx8Tyohu
         vksMTpHHzpgCcYbB5I353f11l1+Rl0b7CZwBrkbW6iVTTk/mUe7Izwpqq8ref7CYODWL
         Ife47TRw9utTOWZaHwSNvmfSYHFBHgKAWn5XMDtvrDdSoeiTngPmTJRex5BAq8eE/OEH
         Vjgw==
X-Forwarded-Encrypted: i=1; AJvYcCWL3y6Al9CMhIjxE2i9z76JuWOP2AiFAGXrk3pVasLIccym4QUgi2i/b074zorwyqN3tIqn1QkKNqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPCKqHHATQUkYM8hzmPkYQUpqElURM3rL/35uyjcVO68fExAjX
	2S4hj3zs+ZVg8lU/0FpNOa623I5pdZxmKEbIFxlll7WEfCA/tRturpKiflPV3SSGy503mt5CP3o
	7H2PPK7i9gQsD/FFAG87GRSgjzK/y+mRGQoDxLhwTUweislU+RXBik0S7i7fUIg==
X-Gm-Gg: AZuq6aKNDZmWUMuTqF+p6+UdrY8YWBrsy6hve6R7xG8LhRLsxix4RzEzDzjQ+yK5nPb
	VH+nSpv2PabpftmR72Ik/aaaOzhTHdFBmk2s0n+gkU7smLS7Q7d//bFgVdJQyLYMfdaCqbv5/UK
	/Wdl/wl57UdT6Omk2peseBdeHjI3gCLml3mFYhHujLqJ0/Z+eu6CaQCkhSv3pcur/PMqkSAaJpz
	ZhD8FZagAAsfzajrC10+0Tfaivxk1+dpFDn0s87peLhDJTWaQUu/FNuwUgKTjC3Ym193kB4J8z5
	T+pMOEYjCc30N49p6yR/C541m52UwW+xRhrfC2Go6CpVWFWUhmjUj3gm5ElHV/BkI00wkRQLVzK
	GYParojl6N+poYvcWRXFgT2Go8qgJ+BaRMxOsMNXhCsj7zYpAiAm+M4BGhz7w/dkcChYNZqEQ
X-Received: by 2002:a5d:5f47:0:b0:435:add0:3d68 with SMTP id ffacd0b85a97d-4379dbae475mr15843990f8f.58.1771259509642;
        Mon, 16 Feb 2026 08:31:49 -0800 (PST)
X-Received: by 2002:a5d:5f47:0:b0:435:add0:3d68 with SMTP id ffacd0b85a97d-4379dbae475mr15843940f8f.58.1771259509158;
        Mon, 16 Feb 2026 08:31:49 -0800 (PST)
Received: from stex1.redhat.com (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8209sm29818473f8f.30.2026.02.16.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:31:48 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH net] vsock: document namespace mode sysctls
Date: Mon, 16 Feb 2026 17:31:47 +0100
Message-ID: <20260216163147.236844-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

Add documentation for the vsock per-namespace sysctls (`ns_mode` and
`child_ns_mode`) to Documentation/admin-guide/sysctl/net.rst.
These sysctls were introduced by by commit eafb64f40ca4 ("vsock: add
netns to vsock core").

Document the two namespace modes (`global` and `local`), the
inheritance behavior of `child_ns_mode`, and the restriction preventing
local namespaces from setting `child_ns_mode` to `global`.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
Hi,
I guess this is `net` material since we forgot to do this change with
commit eafb64f40ca4 ("vsock: add netns to vsock core") landed in Linus'
tree in the current merge window, but I'm not sure if we need a Fixes
tag.

Let me know if a Fixes tag is needed or if this patch is net-next material.

Thanks,
Stefano
---
 Documentation/admin-guide/sysctl/net.rst | 52 +++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index 19408da2390b..c10530624f1e 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -40,8 +40,8 @@ Table : Subdirectories in /proc/sys/net
  bridge    Bridging              rose       X.25 PLP layer
  core      General parameter     tipc       TIPC
  ethernet  Ethernet protocol     unix       Unix domain sockets
- ipv4      IP version 4          x25        X.25 protocol
- ipv6      IP version 6
+ ipv4      IP version 4          vsock      VSOCK sockets
+ ipv6      IP version 6          x25        X.25 protocol
  ========= =================== = ========== ===================
 
 1. /proc/sys/net/core - Network core options
@@ -551,3 +551,51 @@ originally may have been issued in the correct sequential order.
 If named_timeout is nonzero, failed topology updates will be placed on a defer
 queue until another event arrives that clears the error, or until the timeout
 expires. Value is in milliseconds.
+
+6. /proc/sys/net/vsock - VSOCK sockets
+--------------------------------------
+
+VSOCK sockets (AF_VSOCK) provide communication between virtual machines and
+their hosts. The behavior of VSOCK sockets in a network namespace is determined
+by the namespace's mode (``global`` or ``local``), which controls how CIDs
+(Context IDs) are allocated and how sockets interact across namespaces.
+
+ns_mode
+-------
+
+Read-only. Reports the current namespace's mode, set at namespace creation
+and immutable thereafter.
+
+Values:
+
+	- ``global`` - the namespace shares system-wide CID allocation and
+	  its sockets can reach any VM or socket in any global namespace.
+	  Sockets in this namespace cannot reach sockets in local
+	  namespaces.
+	- ``local`` - the namespace has private CID allocation and its
+	  sockets can only connect to VMs or sockets within the same
+	  namespace.
+
+The init_net mode is always ``global``.
+
+child_ns_mode
+-------------
+
+Controls what mode newly created child namespaces will inherit. At namespace
+creation, ``ns_mode`` is inherited from the parent's ``child_ns_mode``. The
+initial value matches the namespace's own ``ns_mode``.
+
+Values:
+
+	- ``global`` - child namespaces will share system-wide CID allocation
+	  and their sockets will be able to reach any VM or socket in any
+	  global namespace.
+	- ``local`` - child namespaces will have private CID allocation and
+	  their sockets will only be able to connect within their own
+	  namespace.
+
+Changing ``child_ns_mode`` only affects namespaces created after the change;
+it does not modify the current namespace or any existing children.
+
+A namespace with ``ns_mode`` set to ``local`` cannot change
+``child_ns_mode`` to ``global`` (returns ``-EPERM``).
-- 
2.53.0

