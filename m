Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B352C21E5
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508845; cv=none; b=mYSXQgDxPymJ+Jpr3o3iYQYTh0xTC6yv+t0sC44lOeiq5yltYRbXEEpTV9K2OLckrOxF2MN2fnV4Ho1P38EF9gT8rOpTron8a6S8UYAaafF7hRU1XqVvfrBt+TL8KnL5bNWdkTSPrUCeyPFfcmStPlRqHS4SYubL4ISOJYxP9Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508845; c=relaxed/simple;
	bh=jdDLR5zSZaMeP6Z0Smw6SGxBy/T6QQ6s+tHgLG/YIuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4k3l6Lu1uf3pxybK5n2x5zdpwXh0lrK5yO3HzOl5et4oz/iVYvqth1CBaWLBBUFk/omi5SITc03fYAJRO5K2EfRxkNjpzMTXmwz2qWM2/TVWId/qKEH3cnbiLWzbMXK6AGzq2MACcqV183VFMZESYrP8n4+sJRCjayTn0iteiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isZ7v06G; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isZ7v06G"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-330a4d4359bso2171846a91.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759508842; x=1760113642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EqyC5t2SrD/bODU9RpzzMMs5DHytzZzsB47Ks78jSw=;
        b=isZ7v06GV3IAapqB4JuCfP/O6ID8r4cGyOPCIbdoAbtFA541BonkAusnvoVprm8U1K
         e6tQMKF7dTsZ7aP/lVubunVjT3R1Br7fw97smYENFT6Iv4gTsy1WX/Y5a2wx+Ep0kicv
         2aSgMPXjim1/Ls9fl+ZgVqqk+IjztFpxRh2iDnH+enMi5RY0jxI6WKXy0KZ0U2WU1kDb
         NC/+WpvKqBG+nB37vtQVRrvNYlTUisM7JTYXFAxEUh6iCXsbAPz3IAMu5UdR5OjbZpVU
         z9it6SocWwgA5XkSRkd2cHSI4ClTAaKiZedGSVvUUjKCKMQACfYWEnDo5I7vr6iA+9v+
         N8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759508842; x=1760113642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EqyC5t2SrD/bODU9RpzzMMs5DHytzZzsB47Ks78jSw=;
        b=DBF9G0t87nvCKHsg9TZ61UxXpPuKGO/MQpLwWpTeApvbybLfoarArMr2W1ge3GMl4A
         Jq6h3dvT6pkHryVtyW8manNbKethigG/ktMzPtOahd0UTxEbTHqHo8bmwdIYsu0raY4V
         LGsnJfL7414JZf35xDoN7Mrm/mEIhNAojpgr93WOEhjSAzGCbaRMrYPj3bgsw8HAFUq+
         Ll1DOQKo00O1TcmueuGCxE8hhifULToj2Z8f3Le3KZqxnm2fFv0PBRFjU/5CFHnXGbVp
         9BKMFXbT10QEzWtb1g217nmSHMGkWvB6MrMjS8NaETm2pCsLt3GhSS3ZLF6eZ4/cggNQ
         nX1w==
X-Forwarded-Encrypted: i=1; AJvYcCVsP5/gtwNFTBpqo9NUyyN3q/PXBNBSuZcqSd4Qe2PIsEBMRuZUSOU02HH/dAXx5hBxMYVuj8m0ntg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DKKiFlx6bTK96N95svGkDSNuK0r8TJKkOToZnZbVPQWJv4he
	X0wILk/GuQxbcfGQWwALcLJDWMlrKWkkzzbxEu1NO5J7AurEHU2K/lD+
X-Gm-Gg: ASbGncuPbRRQEnwNr7IVtQZ2twIZDAs+w9604o0303sX9NXjJXLKDzeAcqm5HnVO0cI
	TO+jsOK0ZXpLZXM/qTKLw9UlGoXoCdbxAi1tgAjXC495eL4Rl0CIJ26eq/MwTagdwjqLpFfa5D+
	ssnQra/qa0VXos68C4iM4Oi/94g2G1DOGsVKxCJV+Os+vAIvHt37OBQa6aDiTMntpuuU5i+y7Bx
	Mn7mun2PATjH/c0VGV9N/imNOujCiilZzEN+7aKGiuGIADxFdPYp7nO7h9mze9xjvAXTz2n81ec
	qIUPQKDoVMB2lT8JGHAXHZ6lzAwINYXqLtoDBq9xY1dRAU/IUu7ksTGfwmmUntkK82+EEqpUE4U
	OpnU105y9kMJhXFUaNVodO+eCh6d6lx/Qnhv2j73AwGEL1CrNsTVa+tW/Y/sYx1Ehxg==
X-Google-Smtp-Source: AGHT+IG2rNSUruY8DM1klEXzzCzW/OV+wycqjmFkUs0EoVxuzcjtow/eEbQKdm/Kq0yZONOSJQEGTQ==
X-Received: by 2002:a17:90b:1802:b0:32e:7270:94a4 with SMTP id 98e67ed59e1d1-339c271ebd5mr4418563a91.14.1759508842185;
        Fri, 03 Oct 2025 09:27:22 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0dddsm8416787a91.18.2025.10.03.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:27:21 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: 2023002089@link.tyut.edu.cn,
	corbet@lwn.net,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org,
	viresh.kumar@linaro.org,
	qyousef@layalina.io,
	zhanjie9@hisilicon.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH 2/2] docs/zh_TW: Fix malformed table
Date: Fri,  3 Oct 2025 21:56:11 +0530
Message-ID: <20251003162626.6737-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003162626.6737-1-krishnagopi487@gmail.com>
References: <20251003162626.6737-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generate the following build error
in zh_TW/cpu-freq/cpu-drivers.rst:

Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst:109: ERROR: Malformed table.

Fix the table formatting to resolve the error.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
index 5435c3928d4b..7f751a7add56 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
@@ -112,7 +112,7 @@ CPUfreq核心層註冊一個cpufreq_driver結構體。
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency | CPU在兩個頻率之間切換所需的時間，以  |
-|                                   | 納秒爲單位                    |
+|                                   | 納秒爲單位                           |
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cur                        | 該CPU當前的工作頻率(如適用)          |
-- 
2.43.0

