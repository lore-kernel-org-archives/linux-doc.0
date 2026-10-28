Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208640;
	b=uaAOjccETZvmQliiIn3b/SMgYPWzethnW61L+YnMWY5tpeKoFvGbmyWMhjTaodERDyw1
	 YyUFp12DnfDDddT91iEsqM0NxuOZK6X+KlQNQKTCtfExJcGiG7N6VQYJrNYmGJSEOqBuD
	 aVWvy63Os9H03Km/c6cs4/anQ74Z8crZuEdW8jQWyaNABi0f+H6tVAwi4C3lCxZgBOG8c
	 Vi+Mqy/8xFRTk3rthJ6O3JMI64jAv1i02YkVMc37f3ccSuPUGIZx2DjbGblSheANWJc6q
	 zk+U4RuuBOYrc5xXTJBMHOXXb0HomxpC6KN3gU1Um9Mg9TNNS2ZaqI7wBZkpsEAx1Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aT/pVU6IgIaYwku4adsSNoBoyYJO/ByS0tjhWNwyOaU=;
	b=oFaFiqgJYaZvWZjyp5FL9Y58KmgAq3tV6lATn0NsUuMovyKToN2mTfyjFRcvfFKmlSQW
	 ItBeL7Rtw9XCDExx7EEC1ZWCbofchwB5uwkfyAIqM0TIAiZtV0TN/Ylji2FFUd8PhYD2W
	 FCt3p9YZPcTkR1593z51mKftB0uZEmEb/3c+UeMEnQiEzXuHyzSnLy1LXQjeQauAiCOQy
	 HSapYpnOqGzo7NVSLW7wVUJITCVMb3aud/NDS7JQ2tgCztGdAcWdi6XqzVwgzsj5wRHz7
	 qBq9z2el3aUeHkP3bCQzqcxvFoSZ24E8UzqNnT45gWonad5K6nAnxiK4sAYMAvcFt2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="i8oSMlu/";
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1179606A321
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 17:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1179606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i8oSMlu/
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05b68f851so2145567b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793208639; x=1793813439; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aT/pVU6IgIaYwku4adsSNoBoyYJO/ByS0tjhWNwyOaU=;
        b=i8oSMlu/WkbIYGthAShj23qls5PPa/cxrQ80XRTY7eJl6stpBqjqTJoVWruuxGySrD
         Zet9b9zdF8MYfRamF8DMgs5eTpbkL70dL230V2a5giSqkRbElhM3zmNCyl4TDOU21mF3
         I3RNxSFADpGlcEccnqECxbVl5H2SzwAJeGg4F424R0B03qLvEhXDR1Tb1gRgpRx2Iuc/
         CUw3ZMIVtBZO67OfWZ5JBfhx6S+/MgGHU3Bb5FrcpxKbCCCeWZaNkCWf+3RcGagxU3zQ
         V4DU3aAnNuK+8QFF6wVKtsVW16pHwRNHSQD0WqALj+8lM+nCIiN80jMQl1OaLNpyOFrH
         QWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208639; x=1793813439;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aT/pVU6IgIaYwku4adsSNoBoyYJO/ByS0tjhWNwyOaU=;
        b=ygWt8ssXn2B/Xeflhlu4comclkR6FYjZwU3QhelCwMtOPTU/yoyEFiZ48uXFLg0GPM
         wLeEFQPCLloeVhRdP+ZozERw3hyQOgY77Vgp5AQGpUBDxgewvInnZWNsf5mYY7sEdB/I
         5mjgSGlz8tg5brdkbgdgnFNBJAH1ln18TTYRy7yFHPOGCMLPEgXgzYZRKJsyDVuac0md
         +0AcvdrEAjPMsoGXC2ImcDbM7YteI9Jg8Q9qG0rft/D+8+EPZ9KaEqGIa2L511i3wIWS
         M3/R4vXRrH304ImA2pNRva/6lmYRSSs3Vl/IODNWR6wVdH+8X6/cnT7V6MwuDryk/bDM
         DZeg==
X-Forwarded-Encrypted: i=1; AKwUvBxBZGOuj78nBymsfgU0kXqBGV0G58J0vwUQlnKvdF+1GmxsdAFaDoAOraaojINhvUGTuAvtOT0zcxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6QvoGHOVCZZN/Xr1kQI4kYKQEYNcSYDiyNMQL80eoyU46IdBV
	fYuA+R82d7HcckIWqg7w9t/2atfN/Py2m9r5lnpIbeQjYCFp6yF5an2EAI6qPIBvQ1WEcVlkZG0
	ThPKq9fX+trfefXm089DMsvoVDJ12WVrbuw==
X-Received: from pfaq14.prod.google.com ([2002:a05:6a00:a88e:b0:89b:34dc:b094])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e93:b0:883:7868:94d7 with SMTP id d2e1a72fcca58-8a82efe49c7mr111145b3a.10.1793208638703;
 Wed, 28 Oct 2026 10:30:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:30:38 +0000
In-Reply-To: <20261027230853.GA519764@bhelgaas>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
 <20261012-fix-aer-mask-override-v1-1-49a0d7aeaea0@google.com> <20261027230853.GA519764@bhelgaas>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028173038.292999-1-rathodpriyank@google.com>
Subject: Re: [PATCH 1/2] PCI/AER: Make aer_mask_override effective for
 injected errors
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lukas@wunner.de, 
	sathyanarayanan.kuppuswamy@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	dave.jiang@intel.com, prarit@redhat.com, ying.huang@linux.alibaba.com, 
	terry.bowman@amd.com, corbet@lwn.net, jic23@kernel.org, 
	danielmaraboo@gmail.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,

Thank you for reviewing the patch!

On Tue, Oct 27, 2026 at 06:08:53PM -0500, Bjorn Helgaas wrote:
> Can you start with a one- or two-sentence description of what's going
> on here?  Evidently injecting some errors doesn't work as expected
> today?  As long as the justification is compelling and the code is
> readable, I don't think we need quite as much detail about every
> little implementation detail.

Good point, thank you.  Would a shorter commit log like the following
look better to you?

  aer_mask_override=1 is supposed to allow injecting masked errors, but
  aer_inject() corrupts the hardware Mask registers with "&= !" and
  restores them before irq_inject_interrupt(), so aer_isr() still drops
  the error as masked.  Emulate aer_mask_override in config space reads
  and writes instead of modifying the hardware Mask registers, and
  document the parameter with MODULE_PARM_DESC().

I am happy to send a v2 with this updated commit message, unless you
prefer to adjust it directly when applying.

Thanks,
Priyank
