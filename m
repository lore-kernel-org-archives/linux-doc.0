Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B02E03E4
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 17:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782667330; cv=none; b=eVLhZq64kuIUGMZzD+zSo3YI3hDeZObjmf+OE+7pZ0mSJnhQ5UaQNq4Hr+qClX6BJTiB9uezwkprG4joH9CkOqnaZ5rOAs8k4NluTbc9IjO1VUa9c7zAHL+zF04yErzijUQa+ZwWbGTtwe2LAIccDcHEdWfn+q9XS8SfqjC1ZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782667330; c=relaxed/simple;
	bh=K3EOnm1FTPPIVgm7ZBKpbKmC5oI+YrXDEzBB1/dVpHY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JevnbFIMQn+MaCQ9LIPHOeo0TI17hUuBy6xDnyqK5Q+vEX6Q2DiF3H7g8a81R+nghSsiez+N0JsjGxUpRWaOnmRHrE9wnotXMtI6x6mXmku51S490dbhFoxbR4dLKAjcXjQ54XR1YiAUAp36apLGBmBTrq/wzp0YE9RbS7URglI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9ZMZPeK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9ZMZPeK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472a14c9965so533122f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782667328; x=1783272128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBABlV/y3tcVRj6J4pCvx1ErOlS8DPYAimesttySdoE=;
        b=p9ZMZPeKYklW9y9bTUWZv3xL6SxinrYKC5qxU3P6Z7EqCWdR8yfWyWcsx4c4uga1cS
         aqSPWK32B7VKgYG0SbA1DKqWFF4SvPv9n+/PKDkyEzkHFDjPJ3IsmHjP/OZhmjsyLmYC
         /kGnBW3J+e62qCJiqiTZ/KOPwYF6x+P8OLWnJKDqDpYhglZp68xomAami1etPoSCVcs3
         AEH4SIKd70Sv8N0g6Csgxpi6OY4yn+VBPMprnCVb7DoJI+FIbJEAZ24qSCFhw7cqUbSB
         +95cB+MjtzRMKa4aDrWNVLpo+LRybZd1wwMXxcx2zaoaiOA0RhvbBQgyZegVuyJ7uygk
         oLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782667328; x=1783272128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBABlV/y3tcVRj6J4pCvx1ErOlS8DPYAimesttySdoE=;
        b=U1SR+UWwbncMopApHXEQ9Z4xB7moBsV71DU4Nst82IickEe5oJCcRxnK77EOgFDtSG
         tyIjBlRzy1h77/KLiXMZXA1aWghAsqDrYI9Lo3JUPZSo4ZqrwUWaT+zwvcW9WgOz+UDK
         oUEQ9afujz8w9FvhbRmay6WTvCJf2ge3BGw8crMd+qfmNXPr155bDz+BFy1kgWotGhE3
         iT2cLLV5+NQS1Tpwxg4LsM+V4yqaHr15gaOXKv6T3cYjgwwbMtxHxgEtWs07MQif8yi0
         snY0U+o7EVRcU+Un252/I/zTmUxtrBy/Cj9nyQxiwbGgy80CDR9My+gtCuuaVkMxyh4K
         wdwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTvEm/Hwk/vULDqtU4K0CxUXSiWjrRnh5OJC+Zdsz/bifnbCXUuUbY2abIfKEiDhfU2wsHP3wMDEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8vuZsgH5Z4XtorIn4VgPS3FmmkPt87QJ98GuYFBo01JbFFFk
	rYzTYJ4GNHNlT/EfFseQ7E5LBEFtstwchRF61kzatC6IU78IJGin5aWk
X-Gm-Gg: AfdE7cn7zAPadJCTPsPArQAbJZfuzVwPHtlk76c/p8QUlvnCbTVkqclDF9CWuHkSpcO
	QxWhXvuwj4tlCGROwfVKsBhKiGxkPtogqYDr6fvcOg34/ZgD0ZkScwJCeJWPXC0vvnNQ8cKJHDD
	6jTQdzK64+JmtbYKY7jBTEt6q4ETz9sjLXuBTtcXqywJYiVWXnKMyJSZB31II5+l66pTR19z98C
	IE4jCN0K285C8BuZR5hUxeJuKcXpaXuNEmT52J1W7gzmEsq6Qywe2uv6zXSK0apaw3928qCU8O3
	zGwmgdg1rigffskKgXjOhQz6+UllVC7sWelQLY06otnnR/S/GQ48ECKW8UR6fegaQd1G9neDbuX
	uxuF8/8Dnprhk5nu81IHFfRPmfqZuKTfa6EelhRSitUDIY0uy2VIIcQufh1h/pTubGcWPSXwe4y
	A8Rf0kADPI/jxRmpt72siAKHFn
X-Received: by 2002:a05:6000:1867:b0:46d:8695:f49d with SMTP id ffacd0b85a97d-46dc2a1614cmr23514992f8f.34.1782667327708;
        Sun, 28 Jun 2026 10:22:07 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-472c7bec9c2sm7927088f8f.12.2026.06.28.10.22.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 28 Jun 2026 10:22:07 -0700 (PDT)
Date: Sun, 28 Jun 2026 19:22:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <20260628192203.5fb9daac.michal.pecio@gmail.com>
In-Reply-To: <20260628190201.00afdccf.michal.pecio@gmail.com>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
	<567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
	<CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
	<5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
	<CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
	<eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
	<CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
	<02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
	<20260628165040.76fd608d.michal.pecio@gmail.com>
	<62e1fab3-1045-41f3-bc74-4c7624011619@rowland.harvard.edu>
	<20260628190201.00afdccf.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I really think it could (and should) be a simple patch.

This is what I wrote a few weeks ago. It's an unconditional change
for all devices, but it would be easy to turn it into a quirk.


--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -938,15 +938,14 @@ int usb_get_configuration(struct usb_device *dev)
 	if (!dev->rawdescriptors)
 		return -ENOMEM;
 
-	desc = kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
+	desc = kmalloc(255, GFP_KERNEL);
 	if (!desc)
 		return -ENOMEM;
 
 	for (cfgno = 0; cfgno < ncfg; cfgno++) {
-		/* We grab just the first descriptor so we know how long
-		 * the whole configuration is */
+		/* Try 255 bytes first because that's what Windows does */
 		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
-		    desc, USB_DT_CONFIG_SIZE);
+		    desc, 255);
 		if (result < 0) {
 			dev_err(ddev, "unable to read config index %d "
 			    "descriptor/%s: %d\n", cfgno, "start", result);
@@ -975,8 +974,12 @@ int usb_get_configuration(struct usb_device *dev)
 		if (dev->quirks & USB_QUIRK_DELAY_INIT)
 			msleep(200);
 
-		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
-		    bigbuffer, length);
+		/* Don't bother if we already have it all */
+		if (length <= result)
+			memcpy(bigbuffer, desc, length);
+		else
+			result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
+					bigbuffer, length);
 		if (result < 0) {
 			dev_err(ddev, "unable to read config index %d "
 			    "descriptor/%s\n", cfgno, "all");
