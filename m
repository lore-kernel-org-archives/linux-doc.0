Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2393BBFB
	for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723532118; cv=none; b=Ps4C1gPP2HBoy3wKrTUmAM6xbSztZGSHbockYMHbYAYUbxu8K8TJvpb4gQc/Y72G5F8FGrnWnzdMRAiJfOvWcoxXicTWgLGL96QfoH6eu5arGllVrUDKGiflnJmGOlffMId2Bl34/ee3Vn5DEDOoS6El2f+yeDRm0Hah9H1mjWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723532118; c=relaxed/simple;
	bh=8B4zvI1bCw+dHOu3aK2ldYYptYWbx3N9FgU5MDtjVpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IZEtQ4XNzH+FNsJoCjyJS4Bde11DPzm1722xPIw8N8OGqolOHq9dguJvwfJiGcN90qO86pKz6I8ZnLQAGqM8ByNxAXI8kYhmILuT+FvBdfTC5vuwMh8YHNs5PJ+gpvufTFu+LraaRB4kHGafn4t/3u0loHWeVfIemS21w59LPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O31raPcY; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O31raPcY"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso4015915a91.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Aug 2024 23:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723532116; x=1724136916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K8H/cII7rP++UOe4HJzvHxvEEFiXCMFQs92IzUQkIYs=;
        b=O31raPcYwpzNjqDhsY7PholOUnKh7I0mhQLjhqgexzoVKwQu957dFSxwBHHEgVIuO6
         vxPzue0TxW+ENu5h8fsZrF/1Az8v7qHVugbhq9fiOz5mcZYf/tHuXvTsqmn4qAGsWqqG
         ZnfvAaqKWBoiPLld8V7eOUTL80vG1NZ1tRghnVHKbMqJOeTr+o0rCB/90jjBiRz4hlrN
         V1eIISSe/LJrlKGmJGrVrNmb2eGH1zHkdUj9jlbk6ryTe8l0OPFOIi5PO+4A8aLjNvIX
         u9TaR1xWKGGnMmZ6AcpoXIYqljoMIa+VrW4BP2bEdRwRhe+/o9MAQE2Ncy/Fdbbs4JEy
         p8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723532116; x=1724136916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8H/cII7rP++UOe4HJzvHxvEEFiXCMFQs92IzUQkIYs=;
        b=CMKevJ7p2IITByoKpvvVWkp6hyIEcbmf2ux4qvKT5afkLaEfnJDbzNABlpFR/0P2Y5
         3GkXZfCSKowIYUF5JbzVTafwIJym4l7BCUOPTN0pglnLG5i1/7nL/Ld5hFgz/eHvr0GT
         Z9nzxaa8Q2Z9l06hxigwtTNJ+zQNmV77S7UGAkcSdSOesqHqSC3YcmOG/O0kyzrRZUz+
         hXtCGqoA2lsUnp7Po0NBStYyv+QWpXArbUsfm7UvowhzbiSEXWLzdPflZU/y4ykYMmXD
         azXDt2oQ/lRpLZ6HIYqbOcRXWQzkxFuXkwXy/lLLDO91618iATiOVRLRHpVX8hjEu3eu
         EQ6g==
X-Gm-Message-State: AOJu0YzXqq535uxHpUy/1o05en1fsabu7EWFhyu0XNu0Nbrh9E4ib7Lg
	6ngjwDReLBGhVmZCR9HQ7DxbbggXoKRagoB8QVLnZl0B0u8fTVpRa1BESbvXwTQ=
X-Google-Smtp-Source: AGHT+IGxQyyCLfN4Km5Mxtxo9tf7Wyx6f3Hn07VIe47e7HTFli7fPJ0iDS2xS4J2ooTWYsRQkWdmEA==
X-Received: by 2002:a17:90b:4b85:b0:2cf:cc0d:96cc with SMTP id 98e67ed59e1d1-2d3924d2f34mr2876334a91.9.1723532115633;
        Mon, 12 Aug 2024 23:55:15 -0700 (PDT)
Received: from localhost.localdomain (126-84.iitb.ac.in. [103.21.126.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9ca7ca5sm9613470a91.25.2024.08.12.23.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 23:55:15 -0700 (PDT)
From: surajsonawane0215@gmail.com
To: linux-doc@vger.kernel.org
Cc: trivial@kernel.org,
	SurajSonawane2415 <sonawanesr2012@gmail.com>,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH] LFX Task: Fix grammar and spelling errors in reporting-issues.rst files
Date: Tue, 13 Aug 2024 06:54:54 +0530
Message-ID: <20240813012457.388-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: SurajSonawane2415 <sonawanesr2012@gmail.com>

    1. Corrected the sentence structure in several places for clarity and readability:
        Original: "those are described below the step-by-step guide"
        Corrected: "those are described below in the step-by-step guide"

    2. Fixed grammatical errors:
        Original: "That why your might need to uninstall the packages with such software to get rid of any 3rd party kernel module."
        Corrected: "That’s why you might need to uninstall the packages with such software to get rid of any 3rd party kernel module."

    3. Improved phrasing:
        Original: "might not what you want."
        Corrected: "might not be what you want."

    4. Clarified instructions:
        Original: "Instead try search terms like the model line"
        Corrected: "Instead, try searching terms like the model line."

These changes ensure that the documentation is more readable and accurate.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 Documentation/admin-guide/reporting-issues.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 2fd5a0302..e68c1f8f1 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -56,7 +56,7 @@ developers. It might be all that's needed for people already familiar with
 reporting issues to Free/Libre & Open Source Software (FLOSS) projects. For
 everyone else there is this section. It is more detailed and uses a
 step-by-step approach. It still tries to be brief for readability and leaves
-out a lot of details; those are described below the step-by-step guide in a
+out a lot of details; those are described below in the step-by-step guide in a
 reference section, which explains each of the steps in more detail.
 
 Note: this section covers a few more aspects than the TL;DR and does things in
@@ -299,7 +299,7 @@ face, even if they look small or totally unrelated. That's why you should report
 issues with these kernels to the vendor. Its developers should look into the
 report and, in case it turns out to be an upstream issue, fix it directly
 upstream or forward the report there. In practice that often does not work out
-or might not what you want. You thus might want to consider circumventing the
+or might not be what you want. You thus might want to consider circumventing the
 vendor by installing the very latest Linux kernel core yourself. If that's an
 option for you move ahead in this process, as a later step in this guide will
 explain how to do that once it rules out other potential causes for your issue.
@@ -353,7 +353,7 @@ come up with other words to use as search terms. Also make sure not to use too
 many search terms at once. Remember to search with and without information like
 the name of the kernel driver or the name of the affected hardware component.
 But its exact brand name (say 'ASUS Red Devil Radeon RX 5700 XT Gaming OC')
-often is not much helpful, as it is too specific. Instead try search terms like
+often is not much helpful, as it is too specific. Instead, try searching terms like
 the model line (Radeon 5700 or Radeon 5000) and the code name of the main chip
 ('Navi' or 'Navi10') with and without its manufacturer ('AMD').
 
@@ -472,7 +472,7 @@ before proceeding.
 Note, you might not be aware that your system is using one of these solutions:
 they often get set up silently when you install Nvidia's proprietary graphics
 driver, VirtualBox, or other software that requires a some support from a
-module not part of the Linux kernel. That why your might need to uninstall the
+module not part of the Linux kernel. That's why you might be need to uninstall the
 packages with such software to get rid of any 3rd party kernel module.
 
 
-- 
2.34.1

