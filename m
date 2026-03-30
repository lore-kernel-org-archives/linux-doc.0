Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CC03DD518
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 19:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897777; cv=none; b=seAjK/h1T0PI2caJw/BIKzFcvTPxuoUAPZc/cCWbjPNGxMZkPjlRYUyZgWnCo0YbWVyJyKLiR4l0aeFIxQU/2LrnAeHNTFx1AqACHDOskTRDJ14zct9Bnsqk3LGv0hv+d9vWdxkE3X0Hhw+UmYSP3Ukf8eefM7RxybaYrGrz0t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897777; c=relaxed/simple;
	bh=JURd8oj8DauAOeeakbsA/2V+Ea+i6xYudkXoGU2USzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L+TMHBEHafWpRimwf9AmfIJ0mbq+rt+8RGiNVryKj9LNoQgbHCNQD8iYiWmK4oHy8AA8FrXwJwZId5wGeC9kxElfTkOJ1UWCFw5YlpZnPSWVXpHCrq+F8zykFRbRovbQxcnWIcdFN/GrcOS+8OvembXipJcirJK+TYDyL4cKljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSW1bxsJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSW1bxsJ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1593413a91.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 12:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774897773; x=1775502573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gc5QmwcguW7JLhuX/dVskz9qyMueuGcZu2XFmLV1Lc=;
        b=FSW1bxsJokgcGeQXlEoV9n0X2LykP91ice6Czw57YA9Aqfx2mpWQkbTbYlx+K0td9I
         sngzhQiw+z1/gqzw5rpqNnN5+CiLraKPKGNVvXpxICtL2UDgw26nZ70mpTkedk624m1m
         szItatlYYH/APypFV8Db8TO/knhJpMgx5PhBF+p6Dta+386epiua70VQe7RgIJS/LbrN
         2MOwTjM/+vB5l8eEBX9jIyW1vvi3I0cJ90QO1yBSrNLK2NnuGJpVwzj1qMrSyap02Wa/
         ohpeldl0uHwiwBndfv935ysHvSfFRUv45IVNB03vjp9iIsK1ePNfrOjUIiTzWwiW+IM6
         zPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897773; x=1775502573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gc5QmwcguW7JLhuX/dVskz9qyMueuGcZu2XFmLV1Lc=;
        b=JUnATNYN1CnrRRuy5tI7dbYAT14FNbhqg7PlA3/RnEYRNjD0EfuPOIFD7Fn/FDGiSz
         1LyjCL2/HTYReeZrj/DibKWssnvZp8mPAeqRzfzsI78H8Fl0fZvX/FCwDHY3ciMQWwlB
         iImOK2PU179jvMhEuJKPUwTFAMiKtxUCEoJp5mvDc7ertg0Ur4+nDk1HYv81IjZOgJ/1
         aOCLLZLF8UVWbvP+IO2CnG+znFuvK6ik5V2mhI1lBEFvbDYR/ylDOAXA2DtbLbih0f+s
         NnLT91dY70c7j0puBnhT5BKm2YudRtcNRN8XicaUomnTln7wcqMx32bA7gK39EX9JwoW
         /gvw==
X-Forwarded-Encrypted: i=1; AJvYcCWLTMP+stTMJCdL7uovBH6PUzXCZFzsFyi8ZKReVWj7lqjOhaI4k/uzt4PAVVF6KDUrrHIS1Fu4gmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YweGsAINnGjGqtrjAH/+WBk7caWgLJsSgP4pps9JvVTIAbzBjGl
	lcp5QL7r3AXsAv+CsUZHPZvaFTFlEkak3exeTtZgp8tjejEVN4l2Flg2
X-Gm-Gg: ATEYQzzM3UIYj5rAS1E7oXmU3vj2cUFUYgfGIJnY518XdblQbd/K50BVjaaTh0rIQ+A
	jGsWV2utWGUFn2E8xN/VMlmrquq/YU8XjJVahv1o5ct233L7CUNo9OyozkSS170QAU7MkkqDSBQ
	Ck74SRYtkeQSGCgSn01PmOOan+uS0dH6q2Sg3fz17cEBQC1DevTA3reV6VEg8H2M/yiaStsZ+xT
	eAjm5KOJImJNyTj5MEbh5Yc9OCKgL2sRTwyPcHur/jcbE3HXzmd9RSjiPMvdeIXwLisDMwKWODs
	orIW/Z+hQJf+WOrZLIgz7FkPz6MPV5nMBJ1hvlFYkvwqkrhlQG/9Uih7DPX+RXteFGHlR6lJaX8
	rT2D0yXkK0m4UB+OaRVIun5E4GT/mTUR/YSCApDCLxsxgY7f03wCpMRzox0RmvN+07uRsDqKruB
	iyrBbK7chxEk9b2TiNk6QPeqh+OIisbFKhqgs4lG/QyYLhQEN39mHdHjs/bl0cfDG6WZ4sqiBy7
	lnzbbk=
X-Received: by 2002:a17:90b:4ac3:b0:35d:a557:e44 with SMTP id 98e67ed59e1d1-35da5572530mr5739793a91.6.1774897773406;
        Mon, 30 Mar 2026 12:09:33 -0700 (PDT)
Received: from fedora ([103.181.54.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a54fd5sm17441120a91.2.2026.03.30.12.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:09:33 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: ray.huang@amd.com,
	gautham.shenoy@amd.com,
	mario.limonciello@amd.com,
	perry.yuan@amd.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: amd-pstate: fix dead links in the reference section
Date: Tue, 31 Mar 2026 00:38:55 +0530
Message-ID: <20260330190855.1115304-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The links for AMD64 Architecture Programmer's Manual and PPR for AMD
Family 19h Model 51h, Revision A1 Processors redirect to a generic page.
Update the links to the working ones.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/admin-guide/pm/amd-pstate.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
index e1771f2225d5..13d6580894bc 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -790,13 +790,13 @@ Reference
 ===========
 
 .. [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming,
-       https://www.amd.com/system/files/TechDocs/24593.pdf
+       https://docs.amd.com/v/u/en-US/24593_3.44_APM_Vol2
 
 .. [2] Advanced Configuration and Power Interface Specification,
        https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
 
 .. [3] Processor Programming Reference (PPR) for AMD Family 19h Model 51h, Revision A1 Processors
-       https://www.amd.com/system/files/TechDocs/56569-A1-PUB.zip
+       https://docs.amd.com/v/u/en-US/56569-A1-PUB_3.03
 
 .. [4] Linux Kernel Selftests,
        https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html
-- 
2.53.0

