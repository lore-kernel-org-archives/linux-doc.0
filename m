Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40D157487
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788594982; cv=none; b=NdRbisqgflCKfV43L5q/2dcWa3hWjjmr5J9De8dF7BXOUZu1AcTBJ+1LgUTzj+pyGibSLdJa6iKBVBRNm21Twhy257ZtPidUk7OOAI/zVKQo2fMK7ADnyCwZxx5Lhghk1FUBuZZQJJ/Nws4FQ/VIWWAjcf3aPl6YHwEnHKd2OEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788594982; c=relaxed/simple;
	bh=DzQIokuIuiebBoqlyi2mm9lq/znnuSYXVgUpbFffS0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f2OwBon6MAPxCIuJw34u2YILnHiOQRDGPUyzHS1+RL1T2wnDWaWpkxdWOEsjPZV7dgeOuRwcHdYOWUn2cqkTqKRZTkOHnsvEmcJh8TS6tRllxehIs3AoIxuFm+hSTYQ4OlTxUxo+lwrLom/5rUVccIJJzwIxJxtssGhaGh8+MLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGwQIY4A; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGwQIY4A"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1945295f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 00:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788594979; x=1789199779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPLAs8/W3BrTIfsm4m/UzvMsFkHC6fddEYHJW0htW28=;
        b=LGwQIY4AWyl9OMnJNYsKguT3Df6NlpTP3lkND/HZicPGk3BGUCw5qA6WiwUTIyCAMg
         OVZym8TwKI7vTN24D+jIu2mqY+zpUCRmitY3NHpjR43btxxoSyh8Z/JdH6pRlRqe6ihV
         lFCFLAxYZCiZ1POA/gi/0AFfg9H1pAYGRHCNUd0r6Lx0dam2LjXYfWR0gxBBsZYh77ih
         ktNoDWUpRTM4eyYuhIQnBgg5dCS/K6+h4aCZC4MWtuEow4SHbUMPSFoK/X6Du622cZsK
         D9aDAtaroPVXZ4WHYYZAigu5+NLwFsfOiowYt2hnHGwqVs+mojT5J6VZslW2zfMPnYHy
         UAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788594979; x=1789199779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPLAs8/W3BrTIfsm4m/UzvMsFkHC6fddEYHJW0htW28=;
        b=cPTpdFprpYY3ZQfjrdQ1B29t1UX0kWNfBfxFbRysbWJWm+mMiK3r6Skp4unIxnPAOJ
         BLgrFbsxbOoKyY7ifJ7Jq+/MFnwxmXkLRRdJDC+ahziei2iGcorNoQj5Qd+kB1mfal9o
         fSMaS8QpDfovawpOnVjmOwqZQ0zANd11o7yv96L9hO/q9XCdsy9JIm0/oQq38h444GZ4
         ICn7sdZGX1+upWkulIMK/LMbyFZUMFZDBQnDdq7loPFRELRUsqCiJVjHLqmc3J9b4XRV
         /4I/MSiYcd8Ul6Xt5kJxuy8vGlB95lC4Yu+baCnPM5HeRILHDK7kYWeOMk31f0F3QTYx
         g4HA==
X-Forwarded-Encrypted: i=1; AKwUvBz9eKWfU6E/rIGCMuAaCyHfAskasdr9j0T8obB0Sy9blgPHRzHjV0AJI5KckYWiGdTf7FVRahcUkE8=@vger.kernel.org
X-Gm-Message-State: AFuF++nSVcoRkqdMoBWJ3a3GXGxuetDpE5SRSVTuaGWzivn53zIGrHop
	+Hvkax0x72bfiuu/WZblWi6EcbB7S4LwZVv/XpaCsqdxNNaOq0eYmmSG
X-Gm-Gg: AYBFou0iJU/ZPH6FvYvYUIApNjV0N0Uxnupjw/F3mFJRw5BrhdQVheZ7dbNtx2Hxl2e
	uw4R/CHeUqrVRb0+mdwXa9cD2hnWWc52v8umFAW5CdWBco9WwtgLqnP408JfiYfiRoMwtWFuuHI
	8egyoq2hstNyfMy6csRg6IcPX+0oJTM6TFoCoZMsGD7keTIQ428mdQ/KMy/iWTJwxzQ+ceqTT9n
	aCF0KIVAUULMdpev1jDdSaU2zqr68WKK1e3lLZ6QIQeCSsqxM9LcFnqP7voZqgb8a/bCkErSTTc
	18GvvwkXTweYn4xa5GaJvnuhyDlUETnhXvwiDSLedWc0zqIy58BoEiN/wSmOz+13NyHtByNdQIY
	A1DJkXQREfeI3QpbuOijXCn8bOwbQK0Y1V33vkzsRACwBcQuxWXCdlbSYrF6pdBctLSlx6Jl/Kt
	UW7EYCR+nm0sus/41Q0dY51UwHeSxCjMAXOOP0gXocUBEZ4bqSAD4GI5LesIWlENbADtV8DtqZ1
	pZBrTbEGGiPvNwKn9fBfFtWtPS+E1S7S5OERiWeaKNxQLUIoKzDuGZL+zI3AVyb+wXI1ApZsWXY
	RYDuFju5wfDrRaUgUA2OtkeIngsxcmKySYb9lGecdh3Iah4hJ/IFqrZLCsK/DpDM+Hw=
X-Received: by 2002:a05:6000:26d3:b0:484:4146:1422 with SMTP id ffacd0b85a97d-485870934f4mr12842922f8f.21.1788594978754;
        Sat, 05 Sep 2026 00:56:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm1669311f8f.15.2026.09.05.00.56.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:56:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pete Zaitcev <zaitcev@redhat.com>,
	linux-usb@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: usbmon: Fix a typo in the example
Date: Sat,  5 Sep 2026 09:56:09 +0200
Message-Id: <20260905075609.32879-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ubsmon_packet does not exist; the name is struct usbmon_packet.

Use struct usbmon_packet.

Fixes: 6f23ee1fefdc ("USB: add binary API to usbmon")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/usb/usbmon.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
index 6d5ec1e62d09..667b84d3ae56 100644
--- a/Documentation/usb/usbmon.rst
+++ b/Documentation/usb/usbmon.rst
@@ -361,7 +361,7 @@ Then, execute a loop similar to the one written in pseudo-code below::
       ioctl(fd, MON_IOCX_MFETCH, &fetch);   // Process errors, too
       nflush = fetch.nfetch;       // This many packets to flush when done
       for (i = 0; i < nflush; i++) {
-         hdr = (struct ubsmon_packet *) &mmap_area[vec[i]];
+         hdr = (struct usbmon_packet *) &mmap_area[vec[i]];
          if (hdr->type == '@')     // Filler packet
             continue;
          caddr_t data = &mmap_area[vec[i]] + 64;
-- 
2.53.0

