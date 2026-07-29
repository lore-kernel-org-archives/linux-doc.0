Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DDA3502A6
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 03:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785296262; cv=none; b=A9Tb2JX8bagfRQi6Qv8GJAbKqeu9KbNCsALUPGxoViAvU9kJW0lyxsk9PW5Gnt6lUovoLaHwZ2G+fs/jB1wMwkUkL11wvWo4u4D8rOlbMEH9ThC3aU2+BbEYKCuU8xczc1Wr3LEWSoFid6bE737UuEqqaX0CE/t3lZODbZpKUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785296262; c=relaxed/simple;
	bh=CWEjSl+72xgo5Eu3CbYFnv7lCFrgHH8oRMtXhVZeK50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7O3WmguN6J17TWJ9pTzV1dE9BoiDtVrgwrBWnxNroPSXxpBxiVV97k5jPvJ0OVAjnT45HBXpSyjFKqWvRM1TKzzmy5HXxTMn+bdgcxNBvoH5XdHF6i7jkiXW87NJHAt1RbF1GFAhLtADnGZvQa2rVMWu2gcfXgiBwRbOAw7VZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3yq6Fa9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3yq6Fa9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so368522a91.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 20:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785296260; x=1785901060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS0IrsM44kZUGaGhytP8PP823NCCJwpZY9n5wWxfSk0=;
        b=C3yq6Fa9dr9boVhjjaFwLpFyGNSlu3wVrVA+Rui21dc5D5JnsuNjYGHfhcxp+dasvI
         7f3LH2DAu9C1xCcILCBJCcnDsrYGU97YNeD7QvLbCkcMXgRvvXqTcHN/jHi2Ztwa6d9C
         eisJa68rAtfWPaJghKMFNmm/3REYgQ7w4sAoJTGVJG611yFlEDOxHCkU9DgW5MycSBQr
         FuBF3A11W5EyGgVVKcSvmmYYdE96OfT/V3WIbqm8SabGs2OowSDL1s/gZdYusHOqUa56
         WB8fOaAGGwszbQktlSCKf5A9AMD1JZNjxDNWnCZSqhugULPSCykA4BH+EQmP6iH7iBMO
         9i3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785296260; x=1785901060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DS0IrsM44kZUGaGhytP8PP823NCCJwpZY9n5wWxfSk0=;
        b=Y8nvx/4o4cM7TXmeq2dWOGJKCGj/iku96V7MYIfs+E+RyIy1QdbwCNVoVZZGETQg2g
         IfQlTHJQnDYLBjiuRoJqgElG+aFT44u4wTcC+0zbKXIeu+RUA2mgXSADrcAym621J+5v
         I7aPAPxrugnMbTizum+o0EL+pfX/b4cFXmQ7sTAXJXGMwA+BjKIjrd8J64UUmaMz6oHH
         Aix4pE8+q9kU3O4OpE7O0mQOQcXBmerlHcVundZhXlX0oIRQqnFaV3N9GR8ZhcS+Df0g
         HdYFVnak26lphHDLYCAmWnX0S2u6HbXpVNudJ2NcLliPlvqsxDUmlNN0aAPMSVDhiXax
         0SZA==
X-Forwarded-Encrypted: i=1; AHgh+RqdrYCznEuWuUAjPiPdtrxgYYVDx8Xr86UhdFYoML2Z6VDeQUotyoUU6Ijp1BxQCRidGrsWO8T2sEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhjnyt4N+Jx31ux3NFTyqhlOWc3qSqtBKeMLNaOL1my1Gw1JPH
	wIp56WXOVYnb/vd7/5Vcv1r49Y6fNGlQgMfSVuwCTpVqOf5+N59tIbCz
X-Gm-Gg: AR+sD10RfLiHkVmUXIqwjcQp2mFtb2JULtXYA1kIpfUuOcO9A1xMtTc0ydpRRkQrxtB
	f/mwW/owUf1kOXqtFbL8ZoWGPB7fz/A9jQ7SLL6IstTJHiFnldbpE65FzdKQ6WWG4rQ4wCzv0bj
	PUYFKbUFyWQDJmm5BB+xZ3exSWxmIuD4Cm/JtzQc9lvVm6mKG5OuUCbEJeQhFV4loqlkUt3aYal
	piINJwJ04qDgw20g9218WpwK79vXUD5DzyX5R3qxltwlwHcCrjwHgvASrS4PGP7OyI0Z7j0F5Jr
	1sRJLMrrl0VnqVEUETsD/CCrB9qOkl3JG0VZtLNlEPyyVZS15oBgTR4SpzIw/tzs/eDLDGcreyN
	JMnKGaIQ0aoWufac1XDdzo1a2AvY494qRLVW1SFdNH6ovNMvd6OnaelERB5awADhVThEA8Nq46y
	8qvAeJogYxbthBtHWH4/MBNzG9VS/oroBs789yRiY+UuE=
X-Received: by 2002:a17:90b:38c8:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-38f6a440bf9mr4959403a91.2.1785296260083;
        Tue, 28 Jul 2026 20:37:40 -0700 (PDT)
Received: from localhost ([2a09:bac5:42f2:1e1e::300:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6411189bsm2045726a91.3.2026.07.28.20.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 20:37:39 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Coiby Xu <coxu@redhat.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 10/10] Documentation: kdump: Add arm64 and ppc64le to encrypted dump target support list
Date: Wed, 29 Jul 2026 11:36:50 +0800
Message-ID: <20260729033654.311541-11-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729033654.311541-1-coiby.xu@gmail.com>
References: <20260729033654.311541-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The encrypted dump target support is now extended to arm64 and ppc64le.

Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 0bf2eb100a05..36ad6125c670 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -572,8 +572,8 @@ Write the dump file to encrypted disk volume
 ============================================
 
 CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
-encrypted disk volume (only x86_64 supported for now). User space can interact
-with /sys/kernel/config/crash_dm_crypt_keys for setup,
+encrypted disk volume (only x86_64, arm64, ppc64le supported for now). User
+space can interact with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
-- 
2.55.0

