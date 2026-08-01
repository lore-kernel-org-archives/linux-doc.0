Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6813335E1DA
	for <linux-doc@vger.kernel.org>; Sat,  1 Aug 2026 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785583095; cv=none; b=trZQuwIfIB2zDy55UFNi+YBNshPBLpVkhct/lwSnsgCRTZAU1tYXD2T4j4luB2Hsd5qEa3AC9J0e+cftJLiQvYR6NXKjqpMlbM84+/ZYl2HwBHmK64T94m5fkXS4Z7RTqK4UNqtwciCPmWsPU43/YK4sCpEr2vCPj5KeQ7+uq8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785583095; c=relaxed/simple;
	bh=NPEBvrt5ZbaoEk9PLEq/eC2w7vBXpetQazDzpSUUG/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=te+dYeXs40oHyuWgwT087lpV9EOKIL4qw6OOxDmq2krbB301/InjU1WLM9WjELH2rbBEE8vCX5OaBw/tuGlOIIwI9GAc3a5XvOWhwNNzrz/xRJIAiLO0kAKW07cdVY0tnWEue/FjfxZAzznsxeQd4k58Q1948AZEdKzD+81HUC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRkWpyls; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRkWpyls"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1901191f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 01 Aug 2026 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785583092; x=1786187892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpE77+UpX7tjb7BgpfaEz4mrjgXeleExLIigVJX5YNs=;
        b=bRkWpylsUhqKDE2CQE7/AYjjskORcpoI4mgp3Q5kCnMDtZnxVl3IZJzOS51+89ooiD
         Zld9jfDO4cHJs9Wp1Rr+qSga3Fkp6/EmMbNTv8MeZjQ4q/bGTbga5r1g1fZECrE9YOcS
         RIygXWeAFgU1fq7gSZMzxEFTYYpjKnHqTdrcB9x6+ldWgXqm7hPqkDtyC5Vn5GZ3sxRv
         a06cpLCgGGxmjqBP3o5nkohFGQUeDkoKiY2fWxoL6OE32tEDmxfe2xZhkDo2EKxwTYIc
         btoceWkJHhBiWahjYLfvz8F7AuZAbXI375NiwFMpTMj2YjVMehm7Q2PPr0GJHzsf7xZd
         9sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785583093; x=1786187893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpE77+UpX7tjb7BgpfaEz4mrjgXeleExLIigVJX5YNs=;
        b=ejljCKys/G3+E0ZKSfm1BtVhlgzi3co1TvpwazT9uqVzzuBNK77WtoDT0tXddKx6WY
         q7QWE5B9R5Rvlb/dBts9YWqFVQ++vivPdlftOngHPh1Ew0TKL2Uk/JnOI2rJdZFMZcD6
         SbNLse2BWKgWEdZGKJVe6ziHtPLkNVCz7dNLj8Tn5N6a6ahG+WsG1Gn2yE62U1p4Gi5H
         1bK1njvsmPttcUBo332KkCIoxOg0YKgjmi+QcH/4vL06iz6E/5R9FDGtYeWogIELjChc
         KqU6lk9wDoCWJfOP7iJvqzDkLH8sfge0gYUekrt2HwMMc6iKgaOjCrddbPGPrTe15hU+
         V41Q==
X-Forwarded-Encrypted: i=1; AHgh+RpSjk6YRY5jHRgYtsHESYJhGJ6oPmAGrh+gFzXub+7ol/FQO4cFmX5IYttsb0XecTSQyQdLT64imPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiS8slaa62GsnUfLQyN3cU+7RDcARG1iyj9Mpx8PPYGNQh9uL4
	u9zNZw2VYiPJnQt29WT9JriFRaFkeZshHG0hZfHePAXZoOK0lcnNlZY=
X-Gm-Gg: AR+sD10OdyzAxvGCTGtAEk3imyW6153tF/lBlYRKfiS/gbTKrZvyc0MVFwnUl/GUe27
	DRhbyREqCBslqDVADjIDwcWl4s0x3U5ztUZ1l62XQQKq0xKSqxjDW2yT4r+TdEOSNbcwfkBoLfN
	/VuUKlj9Hc9onoVlI6rQHW/cH+U3AkubjYGhxBdm8NHj16lp++n0NT0f/ejTdgl8LEahnVGldlE
	RAFlHYIUYjfzdSEC5jJfzgtaKq39VWjgn1Zl9Z6fy5EHY2AbTTO/KTbIbXwCZyqYXrz2MdPXDp8
	Huoie/SpHe+FfrwtTpfB0SMHPxLyyidfnPLo1hlzkppL6c+VgLHasszK+1x0wuELqeDk1nd7ZU1
	0hd3RP+7v+AOpzP4Fcnc3y+/ijCIAJxitTEEQma6FIkMah414fowpEYypKg+rEVT9z0G5P3vjmI
	sEzuAyFKK2ol6+CNtbvpADz0QZ8S8LdYkvvCKByDNpPfQlp8G3TaWtmyC7HpATZXXlXMJx4cA4i
	RkxMFn01rvnHuiCnL9S+KnYuH6r5VeCYjQ1AgSEuNoY5zI2UFPF7Reyb6Eima0VYw==
X-Received: by 2002:a5d:5e8e:0:b0:47f:71a0:c060 with SMTP id ffacd0b85a97d-47fd32b19c5mr10140695f8f.2.1785583092579;
        Sat, 01 Aug 2026 04:18:12 -0700 (PDT)
Received: from fedora.cable.virginm.net (finc-16-b2-v4wan-164426-cust896.vm7.cable.virginm.net. [86.25.171.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm14224679f8f.4.2026.08.01.04.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 04:18:12 -0700 (PDT)
From: Lukasz Tymoszczuk <lukastymo@gmail.com>
To: Corey Minyard <corey@minyard.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukasz Tymoszczuk <lukastymo@gmail.com>
Subject: [PATCH] docs: ipmi: fix word order in create-user description
Date: Sat,  1 Aug 2026 12:18:04 +0100
Message-ID: <20260801111804.3593320-1-lukastymo@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "allows to you" to "allows you to".

Signed-off-by: Lukasz Tymoszczuk <lukastymo@gmail.com>
---
 Documentation/driver-api/ipmi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
index d08cee98e34a..062c38d93fbb 100644
--- a/Documentation/driver-api/ipmi.rst
+++ b/Documentation/driver-api/ipmi.rst
@@ -280,7 +280,7 @@ Creating the User
 To use the message handler, you must first create a user using
 ipmi_create_user.  The interface number specifies which SMI you want
 to connect to, and you must supply callback functions to be called
-when data comes in.  This also allows to you pass in a piece of data,
+when data comes in.  This also allows you to pass in a piece of data,
 the handler_data, that will be passed back to you on all calls.
 
 Once you are done, call ipmi_destroy_user() to get rid of the user.
-- 
2.54.0

