Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE923EA8D
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266769; cv=none; b=Yf5o6jz29GrRy9qrhyjJc0l177MKYvLW2lTJ0DuxNcsWSulhIBp/1so5OlFD7LRX7OBb3e31ChNvkLnGv+IaCWR1Y7Qe+HSpgrbg8KcJCC3P7wskegxvn8zKDtFcrFMdFkkBSHwhMSp32LR/FqBijUfLWqoWDy/iTso1Zv+GpD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266769; c=relaxed/simple;
	bh=s6xj00J7/R8m5+mYh3Y2P/mCOquMh6MbMiGoIlq9A+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3SOSVzTOSwRm+6CCjovVOJukC1cOYZrAQ5Siub8UFj4Y50LHyUvnDVGX6tCTD93bIXk2Rja6Mkfv/DVkg7EJWCGjas13TrVOAnJZm/s4oGKYWiVE2lsay2zpk68MNmez5IOzky4BrIr7scaf+eenfrvyW8KVMxNzXVxVs2H31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4K0r7+T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EawEAxwh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4K0r7+T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EawEAxwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762266766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vEZHRadoqRgO4IgyXPFxluBKZrkdYFiHDtDy5XP6kDo=;
	b=E4K0r7+T/2twvEYYoHvtm0NjLz1hq1Izw47UqVfiNJFkcJuX6xjdbyX9yeg+TExx6Vd0hd
	QRD/3sX+53OZ+FbB/ymR3XqccgD/1xcOw7cEJQrcyOi2FekIoYj0LmvEOnUbXEF8F5ro2J
	PWV40+QZ67cdZb7McflICgH8SodOCR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-hKpns-lqPgitUgKl0IN1ZA-1; Tue, 04 Nov 2025 09:32:44 -0500
X-MC-Unique: hKpns-lqPgitUgKl0IN1ZA-1
X-Mimecast-MFC-AGG-ID: hKpns-lqPgitUgKl0IN1ZA_1762266764
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-476b8c02445so45464855e9.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 06:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762266763; x=1762871563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEZHRadoqRgO4IgyXPFxluBKZrkdYFiHDtDy5XP6kDo=;
        b=EawEAxwhBYdmAoDecmh4nSkhbY9OH/q4TLNrsHbbe+p5Bdh7HnnZooenv1Uyy/W8aP
         4JGFZKdP6AnNZzJb/BUZ1R2JlITfHAVJRNvdXvFJgGQtxUnQG+ViasGKhjG8/ub0GUOT
         gGdWnRW7Nwbm100I62QoLM/STGsLt9xbJzdJWUs5lyLGXf9kIPxaechPtmiU/dkvTzLW
         a2Nv+/Vn3eJzre+HsrgZhHkn1iO9mvB6uJern6L3oKQUQi2jHTJmCDLP5hV6Yx6aJsDL
         cRocqJXoVmzR00Oi5mHFVUZDmsx8Q8Yg7xx2qm7VPNjF1wJXHUylFLBfBIfJSJw8Ip0j
         12eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762266763; x=1762871563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEZHRadoqRgO4IgyXPFxluBKZrkdYFiHDtDy5XP6kDo=;
        b=TLVTK3ExNs1a34QpgWA87MNqBP+mF/mSsDVfixMH45xwYFiwXQCuKiL+HKzb5tTc+q
         PQGRNKsai+FMt28ug1r9GCnVAV9V8tcsDh5BX+/KTxMPUVu80dZlnhOJk4tjjCVXUSZB
         PKE3X9a6dHW202XPfm3O4BTnaKp+cBxioMV1ERgIh6pUJshBKwKLScuYlw8560F5ngHU
         BSgfw3b05DBqe9kUyzZdZw8UqWYboONV6aHbM1p5JhVxCa981by1uj5wY4EmvVfYM/Ip
         GqigsEEOI22UP+S2tpb+PkNvBqfh3zqjsqh8iUKvztcdbYYS8T7IJCQuBdGn8r5J0QNW
         5bmg==
X-Forwarded-Encrypted: i=1; AJvYcCXst/ahrZqhjT24xQMxGTa/yCA377pd6icplAMg+liLpHT15o/8ryuIiuq0FhcNL6wsBHxybjTgIjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjnjXWdidhbso0+K7oKaPn2QNREuhxGkd4a7ORQKSS5biV2WA2
	lWooyuFWC0MHWZqVssf7YJL8azlkSfMnAV685Aqvw7bsqTxeDUYKk/B9XlAF8VzZLckYyO6az49
	9iUuXKNRooVvBQ5C1BCCLBgnobBJc4he6ju4BdXHv1/RacUqzZUy4ew6xcPpx0A==
X-Gm-Gg: ASbGncupOZ59Zay1ItUiyte7y7hEKPhiEx0LWGZidstVvCb6A105ya0A2VW6jP4bLFe
	GgnPc0KHxEKyYhSuFh28s6z3eXoKoIeciUz02UG6nleU+uuQd2QJOftks76denxjlj+MPOA+2RZ
	16N49vOrIXQKNC0id3O4/SYzgMDK7f35VwtXk/0rni+8WHa7d9UTZXtWKRbRtRzJGo9JD5KOxMs
	39FFeMhaVdSt5it1zC8HVcMdqZA1KLXWb92N7i0bC1I/skkKz/9WJwPy46kr/Dv56yOVrc25GkA
	neRg00OZtXIrQ1vZNRVmpd0T+wfBExEMmrYC/IhjNVNV6veyDnSsPmz9wgMDUgtCUdMF3AI27qN
	1Sb3DYiWI5I30ZXrWJig1sFu5T04L23r7Y90VmCIXR3YeCIdA
X-Received: by 2002:a05:600c:820e:b0:475:e007:baf2 with SMTP id 5b1f17b1804b1-477308b6d72mr149701235e9.41.1762266763627;
        Tue, 04 Nov 2025 06:32:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuFO1RurfhxQ8KoSwXSsJCryYZmg5ZaBALPYzQvFuAwcNRk3r60dzVnYtxJMdeRZ/p/LV9eA==
X-Received: by 2002:a05:600c:820e:b0:475:e007:baf2 with SMTP id 5b1f17b1804b1-477308b6d72mr149700945e9.41.1762266763179;
        Tue, 04 Nov 2025 06:32:43 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558d8a1bsm18898635e9.7.2025.11.04.06.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:32:42 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Alexander Graf <graf@amazon.com>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: extend file entry in KHO to include subdirectories
Date: Tue,  4 Nov 2025 15:32:38 +0100
Message-ID: <20251104143238.119803-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 3498209ff64e ("Documentation: add documentation for KHO") adds the
file entry for 'Documentation/core-api/kho/*'. The asterisk in the end
means that all files in kho are included, but not files in its
subdirectories below.
Hence, the files under Documentation/core-api/kho/bindings/ are not
considered part of KHO, and get_maintainers.pl does not necessarily add the
KHO maintainers to the recipients of patches to those files. Probably, this
is not intended, though, and it was simply an oversight of the detailed
semantics of such file entries.

Make the file entry to include the subdirectories of
Documentation/core-api/kho/.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06ff926c5331..499b52d7793f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13836,7 +13836,7 @@ L:	kexec@lists.infradead.org
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/admin-guide/mm/kho.rst
-F:	Documentation/core-api/kho/*
+F:	Documentation/core-api/kho/
 F:	include/linux/kexec_handover.h
 F:	kernel/kexec_handover.c
 F:	tools/testing/selftests/kho/
-- 
2.51.1

