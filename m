Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3091199EAD
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975945; cv=none; b=PFKOscRhIkTahQ1vwTW/UGOKKptIE5CZqsRMtXbKOcVNrZC/4vQWYAKDDQmMuAn0IjJUm7b7cI1Bd7VMf4EIQozi5+I/KuXNzM+zRZgGbDtaHkE94wKO56yGRlrTYBdm5UDUAGyntC+BByT8BAqLZYlnxv0Xudpin7jI8z7gKdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975945; c=relaxed/simple;
	bh=nhsyimBQ315HBr0MkYf5dXK4pQhhIUcYzbD+bgi/3No=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UP/S2J/9ls/6V8cFy1wTCCMNE1jGHja68h7s8MabBcGHHbJYNjKXYyLRH0OrxIIqjS2jNTL9WPLYZCL0oGvp1HMoQWQTeL7RkkTKl809WSvwkx0SQy9Q6i3GKqWxDabpEN6IsGI4Y/wXlbrcNK/O6ItgVOjD0DByYGxcSrtMGlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dFusR6oE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vl4vUgQO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dFusR6oE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vl4vUgQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779975942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nFh87XciuXKGHbtJRS+GMwtnVHJ+GuXgjN5PHapSR6o=;
	b=dFusR6oE+odbepH00T92YZjLQuk3JD3a0fJctml2xKYdBCQjNddF70YWj1sRr+hy1lEKpQ
	ABhji/qR2602C+DyI7dRke/5OACbJsyShShN40keMQ5FLfc5Elre+u02psOjjDfwa8Wf5D
	eGidVPmFCWrKaPi5ci855dwFX5aFqRk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-lZ09DnqXPk6nAb-zjKBHNA-1; Thu, 28 May 2026 09:45:41 -0400
X-MC-Unique: lZ09DnqXPk6nAb-zjKBHNA-1
X-Mimecast-MFC-AGG-ID: lZ09DnqXPk6nAb-zjKBHNA_1779975941
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91030497912so2465506285a.0
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779975941; x=1780580741; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nFh87XciuXKGHbtJRS+GMwtnVHJ+GuXgjN5PHapSR6o=;
        b=Vl4vUgQOEPROhDOC/w7KGhrmeGczVxHBK3Vu1brzT15ebcY/9sAqYCS64DWy/ljrDr
         sqQl2Ji74cE/4doWOX3AnSEpd8SImPo+Lyia0fiXSYUkg/+Mr/TZXdYrCUbYn1quxmVO
         QENoyYAV5sQ9hHRE8CEi5KNER0TUXhD5onJewLFeIxw+g2NNgxy7IrtWsgH0+BBdvvBJ
         FIq3gFezACwSIpcEtQcIKTaEJg7AhQf/bnxo/H2XLWt5yPqA3zQIfsQmeJczbOMLOTSt
         bD1eDl/PAi2vU/TquwZcUFQCk4LveL9biNLAo3y2HrMciw5tWyK1pgn3pI3q2u1kGZpY
         fDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975941; x=1780580741;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFh87XciuXKGHbtJRS+GMwtnVHJ+GuXgjN5PHapSR6o=;
        b=NvKyqsj5qpPgV9EVvKAY44qY72N+g88htNLut6+m9/DZjKQrJ90Ctv8K1OnosFCZXZ
         VfZqj+SzTOFGGAQa8lkoHwLvXQFRZm84iERV4hCNclDehd7AbfU6WwZtK2/wJLnpZwU9
         tgIdMJpfsU5OpwiwdWFvhJcmML2LvSIi+8cIcjQ2svV+h2shDm4m/eFJFMmrbV3GrFuz
         jCo55liZKITuMf1rDqOKEeOQ411c+bGZ4CzY4HOsWG4/VNyFScwI9PaLs+L2z0kyGt86
         sOPiVFVjvk4InSUxMrruY4ZxNMRTLGkaP7Il4DfKbrCjZ0AAnLJCf29fspCLtA66HLIH
         Yr3w==
X-Forwarded-Encrypted: i=1; AFNElJ/X++J9tAJ4fSKEh8e/ET4T072Tq4bRq930EOb3tUbNFX6N4UUr/PITFRBKvrU8peNB+w2vJ4gphdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgADL9jIQivXhWnR6XAEq6SHBuUMajqStTezWOWhndYmrzxLKi
	DDuOjDdjaGD4DLXTw1SPru7+pyaL0UaLZv55DqiSeXao92gQuP8jZZcfSKl0Tmb2KDwtVPNjyiV
	BmlUGZEzdq6kEjNg62y4lS+jcfo87cjsOu0Z0j0QQCU7aZPirB8B/eUKDLXuCkA==
X-Gm-Gg: Acq92OFB4bJc++Nw+gBzkyIsoBgZP83lYr0FrCBWlzwBCGFF+jPY1y0zpjAfATuASZS
	6rUH/iJYVYFazPdv180tCxkxRkkWcXezN6QNYEvxMDEAhVRlUwhzQiZYfvSlydyyQpZf4lenLrD
	IUG1CKyrus9S6+44Ek+u3ou1GdLKPBWawtMS6i4ozWqWhD965FgLJ4gDYmCc48jYM9AB9LZxcDP
	BLvG8gRzDL6KcN/vw1Z2ARl7BlGDEpPHCLllGmJYL+yFKzH6vlF81k+gUyoJPbQWpHjND+psFSP
	9Lzb7MZ7PuNZ7iqVuE5yJhucw2LWUpEWovucKASTykxK/N0GloV6G36vSj7ImBWHguSWSG+rYB4
	nxUvghY8BdSjK0J4Y3Pakx9bjZLztUn2mjkhrQznu5sM8+daIX2jYRrpXLhaN9SNugjxlloc=
X-Received: by 2002:a05:620a:4802:b0:915:213d:837 with SMTP id af79cd13be357-915213d0e12mr240399885a.57.1779975940600;
        Thu, 28 May 2026 06:45:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:915:213d:837 with SMTP id af79cd13be357-915213d0e12mr240392885a.57.1779975940161;
        Thu, 28 May 2026 06:45:40 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86ff80esm825920285a.13.2026.05.28.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:45:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 May 2026 09:45:10 -0400
Subject: [PATCH] docs: mm: clarify that user_reserve_kbytes has no effect
 when overcommit_memory is set to 0 or 1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-mm-clarify-docs-v1-1-aa88e83b4bfd@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBuogUy6SrQwHWsgKxSikO6et
 HyL/zMkjsIJhipD5EuSHHtBW1dgV7MvjOKKgRpSTUcaQ0C7mSj+QXfYhL0ys/aaNCkHpToje7n
 /4zi97wffbkU/YQAAAA==
X-Change-ID: 20260528-mm-clarify-docs-76ab8f82826d
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthew Storr <mstorr@redhat.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=nhsyimBQ315HBr0MkYf5dXK4pQhhIUcYzbD+bgi/3No=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIk3P7+dlx5slO2ew+X+KooNZ7Fgf4L31/bE8KWtin3l
 +qGqcv9O0pYGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIgUqG/0nX9onfjnuV7KJz
 X/jm/tC+7DmPpetWv7kc3FNxJ/JUxmaG7+6f9O9VyuszvjTNrjvvOZunt0HjbFRHSvukvWKKdtW
 sAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Looking at __vm_enough_memory() in mm/util.c, user_reserve_kbytes has no
effect when overcommit_memory is set to 0 or 1. The documentation for
overcommit_memory already references user_reserve_kbytes when the flag
is set to 2.

Let's go ahead and add a clarification to user_reserve_kbytes in vm.rst
that it has no effect when overcommit_memory is set to 0 or 1.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 97e12359775c..b9b0c218bfb4 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -1034,6 +1034,8 @@ min(3% of current process size, user_reserve_kbytes) of free memory.
 This is intended to prevent a user from starting a single memory hogging
 process, such that they cannot recover (kill the hog).
 
+This setting has no effect when overcommit_memory is set to 0 or 1.
+
 user_reserve_kbytes defaults to min(3% of the current process size, 128MB).
 
 If this is reduced to zero, then the user will be allowed to allocate

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-mm-clarify-docs-76ab8f82826d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

