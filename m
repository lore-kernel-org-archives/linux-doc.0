Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D424C1EB39
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507606; cv=none; b=q/Djn6Vo+zWKyhAbK56FnzyWFFE1lwVN4LHAPIqWtR/bH+e7q4VKY0zhLX7dux/dIKxVHwxYOYDsD5iXW1UnfoTTsV5GEL9bd0BJQdyyoQ1y+zIeJgx1c2fucCvOQovE8OK2JRikXQMJU3MEZSGeW9IHBPDYY92gxjfJzBS4uPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507606; c=relaxed/simple;
	bh=YV0Yd1DxtJ1hOcg0HiwZFSRu7k0ypqXImHkV65MOPAg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=sFERFXMUHwDhxa4gw5UeBeHYIRwJzxdybuM1G/Uhphv9gHdnhqIwqrA9ZfVTviqZ/ZnuS/NC3MSe9zdR/A/uvfSKESxMXqmJiGP2hFkqYkEJ3C4dpeQY2UO8UKHOlDWy8IB9zV1atsBqXzdQaP9tjWouuV16tNNSYMU+bGTYki4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mytQFnx2; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mytQFnx2"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55783b7b47aso12193757a12.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705507603; x=1706112403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6CX3qh7iRcLJLpXEmtL3DIIxLfD0lORaTLC26UZMxQ=;
        b=mytQFnx2s9HcaRTtGuWx9MrrZ7yvEjN9HG+oo8dlVLetQPTeCrlj4n+hYiMmm63lXH
         V1fqaEvcFZbRwJkttqJabaio8y472vM5vS309CXpO3jKec6CqHxJNwWdfHpIeK36luI0
         PtdrUvXyyyJEyoteqLYA1b4ZobsdDanQEeqlElZJVXx1deDCidM1LTY+j9pKyAZRFpb2
         VG0+tGsVcIdhWObLNlnfEB9KD2vkF+8WVYaty3VkYzq25v7C4qVdMct/TK/Kd84f8ofz
         6OXBLeNJ1/bgplUNdslS5ZZLIXILn8759JG4cfgHpiKuRgedmF78l/ketRkMsNgRdc6K
         OnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507603; x=1706112403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6CX3qh7iRcLJLpXEmtL3DIIxLfD0lORaTLC26UZMxQ=;
        b=c/KcRcmfwxOJAu6IwOfgBaMXCUhDTMjERlnM9+57O23lPrGv4YVChRYKz1y0Rzfhs6
         5gTxxuymh5QqJVrD/c+soIILbCx24wSpAmyeo7U/jFOz8E+msjtGLwo6IVgmBTrIy3x3
         asGm/wV5H8obIJ3J3C+DZwZNdIp/SfUfnk5mbZPwJZ50xdA9pJVlfcNWFCaY1BqoMPsZ
         aD+wE8XYJbpYmDqdTb9lQOJJ1Emvmsa8NncYKShb+JfKU5UGaDo7LMErwMyspLkRwOO/
         BzE2psCSnd09HfaynBcFmmhrFiaKti8vHyneU6SU9EhB4BekD6DPY/CrAM8Kkqw93PJI
         PlMQ==
X-Gm-Message-State: AOJu0YxZ7/crF6s0uSdOnoJP8o3n5Rxg430lHH7065hC7g27hbhMHo1X
	aG7nR6fDt2IMlJKehZfbegifWN/IbesTEQ==
X-Google-Smtp-Source: AGHT+IFwpZvKcUOKMboA7WR7jIqj/NeK3WUTgEGUp8+qVlKnmMvG9sTJso6R7D2Eszsi9Oc7CByCXA==
X-Received: by 2002:a05:6402:134f:b0:559:43aa:4b83 with SMTP id y15-20020a056402134f00b0055943aa4b83mr2750053edw.64.1705507603171;
        Wed, 17 Jan 2024 08:06:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h9-20020a0564020e0900b00559736b84ffsm3012063edh.89.2024.01.17.08.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:06:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: stream: add missing const to Documentation
Date: Wed, 17 Jan 2024 17:06:39 +0100
Message-Id: <20240117160639.1327266-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 21f4c443731f ("soundwire: stream: constify sdw_port_config when
adding devices") added const to sdw_port_config argument, but forgot
documentation.

Fixes: 21f4c443731f ("soundwire: stream: constify sdw_port_config when adding devices")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/driver-api/soundwire/stream.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/soundwire/stream.rst b/Documentation/driver-api/soundwire/stream.rst
index b432a2de45d3..2a794484f62c 100644
--- a/Documentation/driver-api/soundwire/stream.rst
+++ b/Documentation/driver-api/soundwire/stream.rst
@@ -324,12 +324,12 @@ framework, this stream state is linked to .hw_params() operation.
 
   int sdw_stream_add_master(struct sdw_bus * bus,
 		struct sdw_stream_config * stream_config,
-		struct sdw_ports_config * ports_config,
+		const struct sdw_ports_config * ports_config,
 		struct sdw_stream_runtime * stream);
 
   int sdw_stream_add_slave(struct sdw_slave * slave,
 		struct sdw_stream_config * stream_config,
-		struct sdw_ports_config * ports_config,
+		const struct sdw_ports_config * ports_config,
 		struct sdw_stream_runtime * stream);
 
 
-- 
2.34.1

