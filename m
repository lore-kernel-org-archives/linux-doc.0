Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221631328D
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766528013; cv=none; b=B+h9eDKZuokdygrKoJ66BEp1zT8pbTuU+plsXLjttFtSzUfoNuy7ijXN9Iaie5joBuDqnUSQf0g4VQbo6efwDJQu8ogAej6MPDwKniEl97HiUmU322vsdbT/pHv+jNAaGZ/wsG9Thgep9TKUVsMJM5KUOt7MLAnAtQbSmvJE0xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766528013; c=relaxed/simple;
	bh=sMUBMbrK7/ZzTN2ifHo0idjCHc3u2IqyKo1PdHLi5oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z3tbJ3hfNc90hVxOlMNBwrcsd7ggpLejZ0TBZ1kO7PUDOLAJokXlqZj8BQOJs6uXfyvlJYuuRAc8ppc19B9/phoT516SZoPq2K80uDh7C8DGam5d9IStO4QCSYqhE1ypZyE5HcV9h8dxChPynbfbx54xCYvzyI3cTVuUhHHLMws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARsk4y2L; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARsk4y2L"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34c868b197eso5698450a91.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 14:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766528011; x=1767132811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qbMxF+gY7bPHqJ8ldPkOL73xrNsVRUkggRkHgQFozfo=;
        b=ARsk4y2L9vKJ/C6xcHRJVa1W35aenPVGMU5cLNJO4hcrtFuL6Mfx7IWoynZyG66G1N
         VK7IAWxGn0+9WG9pxWE9blQijIKVUUjPlBpB2EvXwMoc+3TZbAu6JRLzUyL6CfWbeJb5
         PCRBZmutep+HFqlZ6UYxHgTp1E4fF2evtDOmHm9pb3vf27iagEIZ6L2S3IarHbiBmzCe
         Nh3n3ZXYytZa40+0wN867AaVxVZl3nHSg2qHZ8PTi3pqge0WPiiJClIRAzDLpTBm5XMU
         yfUaYFJef8Q9dxCfrdUhac8aPwUNTOch97nrEuOGu/cimp95exUn/SCBVtFP0MIlYc4I
         RONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766528011; x=1767132811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbMxF+gY7bPHqJ8ldPkOL73xrNsVRUkggRkHgQFozfo=;
        b=QOVrpvRe8kQ9kPJu7DmW5L8H4GX4s+TXrXFdNkrLMCF2uq1ju1wb+IXgctpKfrQTU4
         +63Q0RnykdVzdZgDa9/IwPNAr3GNeM0Kv8gKUNnMOyoAHllu1gwSQ8ynMq7Bhiks7O1Y
         BLf+Rd+Z4zNA+nuZTemHMjR577G460K9l2P6IfK+6C7DguDdSav9EQgmNG4e02mqsDgv
         /r0R2h8GAJE37zUX3tdoeeqGbmQNXBg7/PwzlT+/sygx49gLJ8cPnp4pAPJGrL6ah82l
         9pW8RKyh+sK27UHUZu3oDO0leZ/uBMG1UyPk1bxKcHCkY9HgdCJ13Qp92aYLtw2k461k
         UfEA==
X-Forwarded-Encrypted: i=1; AJvYcCV1Xje4TIW9UAzd4Rk0oQaMktwwtopZj3JE+glAXKpXPf8IutZ0xbA+zxO8CsGdgOQMsSnrWxFNWsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeT8jhgSluOu9h5z8py/0HoqpUqDLIW37PfhA2PlE4xfCRVPT+
	r/EYEH04ZW0PyL9IRl9yMxLk7nw1YHKfOZbNa3HaLSvhizQGROTwoVZY
X-Gm-Gg: AY/fxX54cR/Qb95siUKvJngsKfxMJoAFsbgx2rZhrfguloxMaNBwH2sjJ2XTaZXb8En
	TtTJTwRHrPay2WZY2LY/6bTFB6guvxkvTutPMSxdYzic/2U6uk0DTVKtnV/wCJjR9oPPbQIexEh
	7lIocBL7jWXyRRfg6DHyaiKVe2TuoIv+x3mk3Uwf+EdBkqe5pHno3w+zh5AE6KQymLraL8E3VNO
	/TdEqGA7PsdEPoM5Yn3H4n9Ex+s5UtVHo5wguV2G+a2l/ynVPKzpACCd3L7ylhDdZi1y9h27LZn
	cMVv9+Efr7jmG9KM0Fp6XYh51gD1LzUkuFnDMzmAE9G7KJUlghpHGqPQ1Oyk9g5fhvr/gg5pacZ
	SZGuFBQv3MaOy0N0+aZjoaEdLv4vveim5mRDvTtJFOdgZbzLYnTCTlRSfW+R4gx2AEaU8QmYcRz
	sPmraLZFVCG7OQLCoXVfkDWVKCfo4quXVWrKn5DvVPYg==
X-Google-Smtp-Source: AGHT+IGikOIURWcD46OTUx3VcgjIsTTbayXLK7FFPsek16ZYnMoDIlgfP2L9P5rmA4oZ7WKOU3FoVg==
X-Received: by 2002:a17:90b:1f82:b0:340:ff7d:c26 with SMTP id 98e67ed59e1d1-34e921557bamr14728161a91.16.1766528010571;
        Tue, 23 Dec 2025 14:13:30 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8838:aa50:ded0:d1bf:9b7c:5ce5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm16742889a91.5.2025.12.23.14.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 14:13:30 -0800 (PST)
Received: (nullmailer pid 28846 invoked by uid 1000);
	Tue, 23 Dec 2025 22:10:36 -0000
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, shuah@kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, Kathara Sasikumar <katharasasikumar007@gmail.com>
Subject: [PATCH] docs: dt-bindings: remoteproc: fix Keystone DSP GPIO binding link
Date: Tue, 23 Dec 2025 22:10:20 +0000
Message-ID: <20251223221019.28823-2-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make refcheckdocs reports a broken link in the Keystone remoteproc
binding documentation.

Update the reference to point to the current YAML schema.

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
---
 .../devicetree/bindings/remoteproc/ti,keystone-rproc.txt        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
index 463a97c11eff..91f0a3b0c0b2 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
@@ -66,7 +66,7 @@ The following are the mandatory properties:
 - kick-gpios: 		Should specify the gpio device needed for the virtio IPC
 			stack. This will be used to interrupt the remote processor.
 			The gpio device to be used is as per the bindings in,
-			Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
+			Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
 
 SoC-specific Required properties:
 ---------------------------------
-- 
2.51.0

