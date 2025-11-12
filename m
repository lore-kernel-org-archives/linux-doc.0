Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7402725A343
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960954; cv=none; b=hFObyp23ORVjYxwxFe4Ew6uhDLJ6g29kZ+dQMgQdJfFH+DZrDTwzD1JvD08AWzh2Za/rLHFBwhWDkSV5LuS3eVgScsRbue8cKc14QlpCjv7vAK6MXMIXDLuj5qYW8xmOMDRTTZLErzjDwLSOf7GOiQozHwBbltPCczvErm/wrgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960954; c=relaxed/simple;
	bh=OwkdKB4I5DhVWVGSI73e7fFifbHjwD0w7111SvrRlUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1Z+jPOzxsyH8pZugSXQpW10aWPJpuAwQQ3+E3geI9sAekyX4FTj+4XmO9EL5VzJmYRegCPsKQGG0x7sNm2uNhOJ3nhhkbhM64PHcb602v57vXxl0ZLLdQ6Bywe2fpJU9RzYBrZy9eUXxRavqnzYDIHL1RLOD8LPOY0ESl7wSSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n4yaMC9Z; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n4yaMC9Z"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso794985f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960951; x=1763565751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzxatPwaT12t+oimIyPlP1cYh9Rjm5+9wuJjQjgausI=;
        b=n4yaMC9ZDRX7T0jXeyvQaK+6uXNxf9Md2b0AZQM9/lMWDKUjWveRqnskc3ihVV/Xhw
         p40M3YY+XIqWkJ2bYtxl5pCsEP356GxrxpFs3/9jqoZ907U6J8e6EXmyVBqgsV6RPJ27
         4CUjTu7km/mBU5RY8T7SVAQiznB+5JUyj1hQfk555s7QaPFBkU+XGomrtx/i96kJsOzB
         6kxqvgFXQOqR7Y45o/eumg8ZjS90CQZ9p3i07haY0v4Jo832pD24r0OfAatiJL1EaL+W
         qChiPVRR84FWPpq7hyTncKh7gdlaCsCc1C2P15Y1glrTUNLKo20YOKURq4+UcGxJ9lIJ
         DnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960951; x=1763565751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bzxatPwaT12t+oimIyPlP1cYh9Rjm5+9wuJjQjgausI=;
        b=LUV/KRR6te1+nPQDc2HuSfCiQsxwjwFQeeOiqSuu0QBlL0Z8x7nnGiQT3+ueryPrpU
         k339BHUHrY0jvDzd7ndA/hBIEF3D907KgMZahDAIv9o4Mam2g25u5smsdli+NmXszuIC
         VVdfN4/wzRri4Z5mpmovMhCggKBQMDdo8NJ8bmKEmJSYp8SsNGXOY8dsHZa/zGisdV+n
         TDE5kyxwnp8Dg2fC6K3nbgzuFxjzJqZ+B+8LYmrAhR+me4B42n4RghiaAb0cD8CFg2ue
         o54uksdOxpenlTEFSxQTUTVHAbKCIynRy124vgMJbjzsUxXbL1fVf/P4R0ciPWmscSfS
         Pg1A==
X-Forwarded-Encrypted: i=1; AJvYcCWFNCpoI1JXnHvhuiIupLZZ4z5X0ubiOV6PsMAGmi+J2FnEcMrxB5i54huQDuhMRTUSO2ZKvVQbpj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Fsn3gVcvSLb0TdV/CWcdD6f4ltG6dlHMqgkHGXSmevR6ayts
	dmYOiWoYlaycLFQHasatk3RXm/DicWPX6wv8kvrMMDRcpWYMAzAzKCNYtmjBS5b70OE=
X-Gm-Gg: ASbGncvN8s8I2K2ieJNIB6yz9X9virHmlijarrfZ3S9rR0t4qWi5Ct6S3RvXVkfGPjx
	PT9N63KgujnvxeV1jfOWRsSJK3CBTnl+yi6cLL2ktwiuwBolxxm9NXoHLr+BWD9n/mwtJRM9q+7
	hyGhmaEli6idkhu+veKULXAR53QfOJsj+syGlb/jTPNo6pySou2T1aXIugAJBAkZuZCZ7qBFl/A
	IDUYrYUMcEYJV3aVv/P0Rv4br2YcvQI6yzWtq6UHW+jHQyPxPVSUOVGyGng+tMqVffqU4Vpw1oV
	5r25cxeaZLvPY2iZs+c/uzxROkFLo7HDb2QL3/2iRSW4VptHfEcQW9dxxkk0YXLViKgHgM/+zq0
	fAft/rit+TPm1SCUkrzGqv+uIVjV1ncyx7rMpQ2zYprEIbE/q5VyyiLzVjRpO9SRa7HMlFMbEKL
	fTY9InO/W2HA==
X-Google-Smtp-Source: AGHT+IGB7ysGckgxYCnh4ScRny7zYE81+b6VpNLPB820Ao4qDE7C2hKXOhk1d2vMPEvdwcsZY1zqmQ==
X-Received: by 2002:a05:6000:184e:b0:429:c4ce:eeaa with SMTP id ffacd0b85a97d-42b4bdd625bmr3030116f8f.60.1762960950859;
        Wed, 12 Nov 2025 07:22:30 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:08 +0000
Subject: [PATCH v4 02/13] coresight: Repack struct etmv4_drvdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-2-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Fix holes and convert the long list of bools to single bits to save
some space because there's one of these for each ETM.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 37 ++++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 56a359184c6f..8f546764908c 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -962,26 +962,27 @@ struct etmv4_drvdata {
 	u8				ns_ex_level;
 	u8				q_support;
 	u8				os_lock_model;
-	bool				sticky_enable;
-	bool				boot_enable;
-	bool				os_unlock;
-	bool				instrp0;
-	bool				q_filt;
-	bool				trcbb;
-	bool				trccond;
-	bool				retstack;
-	bool				trccci;
-	bool				trc_error;
-	bool				syncpr;
-	bool				stallctl;
-	bool				sysstall;
-	bool				nooverflow;
-	bool				atbtrig;
-	bool				lpoverride;
+	bool				sticky_enable : 1;
+	bool				boot_enable : 1;
+	bool				os_unlock : 1;
+	bool				instrp0 : 1;
+	bool				q_filt : 1;
+	bool				trcbb : 1;
+	bool				trccond : 1;
+	bool				retstack : 1;
+	bool				trccci : 1;
+	bool				trc_error : 1;
+	bool				syncpr : 1;
+	bool				stallctl : 1;
+	bool				sysstall : 1;
+	bool				nooverflow : 1;
+	bool				atbtrig : 1;
+	bool				lpoverride : 1;
+	bool				skip_power_up : 1;
+	bool				paused : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
-	bool				skip_power_up;
-	bool				paused;
+
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1

