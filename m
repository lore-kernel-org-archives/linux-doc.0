Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E078C0B
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959218; cv=none; b=cEquwuApsIKlNBIXv/3amqmt+MCG/VzlurEWWKz/JVadxRTGQ6fWVXm1rpGhoPJgNvt56NIH7mijpcCekGXZCXzhOknxa8V1bJ0qxsRI6Aj6JjzcE8gqMMT1fQi2YM5TZa5lE+VN/lOBrrdKDFmGRyo2q/XRaksLuNoQ97S9ezQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959218; c=relaxed/simple;
	bh=muJaRWHLNAqEyREyDsVWtWk1D+Gg65Bd35PEgmxwyjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDVKaXvYzTzbdKru2+bTRnG41cGbO/1qc9SzV5jQTyvaqxRJndCujA5bhmBXenPnpzc517wHRU8jHiHWll3JlSzaAUorY1czfTBfueEz8stskQDzqe5pwSyDPoJh5V82S0q6STctXeJD/E9PTqI9Z2Elol/vEbVTKMUY3fqUvhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=RWPK24j4 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="RWPK24j4"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3dc6f653152so16274175ab.3
        for <linux-doc@vger.kernel.org>; Thu, 22 May 2025 17:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747959215; x=1748564015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtaCyH1WfJUArzSfLQLt408RcB4GdI59nwfsGjUrhJE=;
        b=RWPK24j4OBLf0Uh068ZuoYhpDfCmXc6JfmfLeklh7BOIRAgqGvXs/7FNpP3Y+GnnHo
         fh0/FR7jS/CvOADrbMbavDq5nIH/zKBk0Pl+xx+MTuDgfY+D4sxCQUtc0uUMJVWr50px
         zqETgtuz08gIurRsSgXX5w1JwHUnwZjdMs4ITkQMQA5PkewQkAOnwMoj7E8xzQY9RG7J
         BMg4l5Vb7zD1R+u2fqZDjfL7nipJ/mgD7d6QAEn+xawB63+TrvyIcTUCjnZCqs8cmqoW
         9j33RQvw+mpbYVfdJx4+WuivfgTp1rtOx2wmJ2ODIywE9fH61s29qQMp0HelLfCLgcNI
         RxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959215; x=1748564015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtaCyH1WfJUArzSfLQLt408RcB4GdI59nwfsGjUrhJE=;
        b=sl9tqmFNGUIwS4XOcgr420KApIeA6J3CFjCkiEMWJmGlCgpKPVx9/mZpDCBAMDFwtc
         2H+4cwJiPcpNAENKnA+t+2kHqQdl83tlwi4dn8nOnod2XzZJFdic8mlQg7nnPZeIgb7l
         Y3sPua8273RXd4FIW6ZyigbLt5Z+v92nciQWvt/y0AyMtu+mNDJIkfC/sCqOskzQuhte
         Fkb9TUV2Nmv3iqgcN+yOl9rKEBpB1cwIxPhnLLbh9laY8fmYWjoKHAzB2uc3tMN2OEfZ
         gyuvfifRyrMISBP2d5nsXrh9rkvCqAliK8UCM7/EFJFZWDfLtCGNoThCcgzezUY5RTw1
         0Wzg==
X-Forwarded-Encrypted: i=1; AJvYcCX8hLvS/xvwJqZr+lpnc6O1jSDEFbZ4ZOec2ek+iihditj1fj2I/pO/hGGba64G+kmIIVUUV8eD7eA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6OVednDnHM4MrhOnKh/2Rp/PtlmECowKSDQlfwKnwNzl2L8YG
	5rTbGfFgzJX9RICtQFWQ9TmMbBiX8+/S+SPC+VWR+KBtSi3DrM/9Bzdlm39zop9Mggo=
X-Gm-Gg: ASbGncuPUYG/E9yKkMiO73l+IcZZVUgrhBsWK5byjIY6+ZlxIAqGq/ZOXFndnz2pcKI
	eAcoZ/rpzvvkUgqv2o8EzPyamesoAwaDH6lYrgcB+haRwdHYjyRz+zmf1TbLg9MeQAlh4+VRYoD
	50bx7/hfQ3e6HqbCSzwJfNATzfkV2pDqmpPw3VJxeQ4aH0awQm3ybcyxFI3o/aHeNhJCY/3CW54
	vk/QURcbCr7X2yKBkEXFa1mfiLxDbqBf3qobXoCXfu7hSBbMiqdWRd+cW0k1HCTKqA+4zKBlkZi
	1jUES26AcXRgMH8At6wGMY09EONhqKG+S/bJh64tajNjJWoBlB92GRPA/5f8Zxi1WAA9AYJZeGN
	EZ78lkNg=
X-Google-Smtp-Source: AGHT+IFKmxDugOdIs6vFYcotQEFU7a9JdAs53jaauyO4yjTbDeTgs1+LUU9JZAtgqiOFD9DNicpN9Q==
X-Received: by 2002:a05:6e02:3c04:b0:3d9:65b6:d4db with SMTP id e9e14a558f8ab-3dc93276652mr13178285ab.12.1747959214980;
        Thu, 22 May 2025 17:13:34 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbd17aa848sm3183450173.67.2025.05.22.17.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 17:13:32 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] docs: powerpc: Add htm.rst to table of contents
Date: Thu, 22 May 2025 18:11:14 -0600
Message-ID: <20250523001112.102087-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes fix the following error, which was introduced by commit
ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
repository without any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

There are no changes in v2. I'm resending this patch because I addressed
it to the wrong email for Shuah.

Fixes: ab1456c5aa7a63d5 ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
Link: https://lore.kernel.org/all/20250517210757.1076554-3-me@brighamcampbell.com
---
 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
--
2.49.0

