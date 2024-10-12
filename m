Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEE21474A7
	for <linux-doc@vger.kernel.org>; Sat, 12 Oct 2024 21:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728770321; cv=none; b=tJdIIUWQhgpODqoclXvjfV4iV1USj+ur0PNHhkXL3FNEbF6BWQU58uJTY4WTqIRZCxvsT8iN4VXTrW24GG2vZIfgDgvXSKzt5QHVljlOEuda9iHHVJYnT/ABf52S+MTnteQrBvlpklsawirvHg9Y+NeDWxcAdqzQueFI4O3YTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728770321; c=relaxed/simple;
	bh=4p9zMCHyTvIHqWb+RiLLmYJIcUZSBcLyXxn110UCViQ=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=gr13pEOxx9IBGk0L5pmcf5t908jCywn2os9zx0UZieE8URjrfs0bhvdplIrWf5LDVhEUJ+inVMSDtBqjkbfod6/BhS6VNnkr9Cr9xDUk4F92Bmz29PzcQxh2oGzWhsRg1VOOjUWTjqbGxzxiL6nl+2dyvEzl5v5452h+7K0zqrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOS9btKg; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOS9btKg"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-20cbb1cf324so9323485ad.0
        for <linux-doc@vger.kernel.org>; Sat, 12 Oct 2024 14:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728770319; x=1729375119; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p9zMCHyTvIHqWb+RiLLmYJIcUZSBcLyXxn110UCViQ=;
        b=ZOS9btKgaKkdPY1BQaXb7H/AtDFgMCFvCdE4iaupTpu26WhKvH9jxYLHr43n5KMg/S
         1rtpRKH5CAnjtJMImR29cZnT28N7q/FPnIO4F0HmpFACTXUwt60TLFdb5IarmaS2urHe
         yyKrJ0bj0S7YHSk8h+7LQKbyeHPWyA2zoRRnIL2sdyPo1pI7OoOw/Ye6mGFMmlqs5laC
         rHrh/rukOANEhYMuurSmQ/aZRAgzQKfFRexM2X0V+5mLZm/6/IES80qX79v+eXFO1sK7
         och22B5j+RFLZABD0dnRF4xGHrl730QEsWt3Bg84he4cB07GSEvlwQcCE1H6B0PVt350
         pYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728770319; x=1729375119;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4p9zMCHyTvIHqWb+RiLLmYJIcUZSBcLyXxn110UCViQ=;
        b=UYfyXHYN8TXkBQAHJlG78/sIxu1DRDRehvDjCnIfsN9zIBbmDXziodSAZtOiabcGlz
         wnnfpiEbU7OB/SX9S/tmzksvLrbdEIazVTNST16Aho6TeOc1YZn8V0QCAo/A9XDCqoJ7
         12gZdit6Fe97n1qfyLnDOWP/aCZnVxmVIKclVRxCb6RHmYYcyl2lFAurdx+ufD8sJz5m
         cTRd6KrdMp10TKImjKrgNuHOeVLlglPumkueIxmmnBAenzryzc93PAYX0SqXlzefBz3w
         edr9B82Pli7pZ8zbi8ilPcveG3bcEkpnX1IppsxwLcX6FegFemQt4um0A8gGnAqIhzy1
         if7A==
X-Gm-Message-State: AOJu0YwsAYDqU9D54qkVi4kqBvjdjDMufXZQ0YUZFlxl/82DB/FchaVH
	cZMUQWRPBe++IA+wq3fw7IfKiE0yQM6PsugZGDmOzg5vRL33Je9Yr3oAG0ts
X-Google-Smtp-Source: AGHT+IE1kYGoltn0KQbh8oY3OppBKN7Ay54D1kGC8HI0o/QSKs6kuS5okkhRHv332cY63NPpSJRSOQ==
X-Received: by 2002:a17:902:e541:b0:20c:d072:c899 with SMTP id d9443c01a7336-20cd072ca01mr24690585ad.24.1728770319133;
        Sat, 12 Oct 2024 14:58:39 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c311f3dsm41387455ad.234.2024.10.12.14.58.38
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Oct 2024 14:58:38 -0700 (PDT)
From: Josey Swihart <nkelemadumo9@gmail.com>
X-Google-Original-From: Josey Swihart <joswihart@outlook.com>
Message-ID: <d5d6de0cf4a29308349b434bb837687a4881b978cc86e633dbfd25f9ce8d0de1@mx.google.com>
Reply-To: joswihart@outlook.com
To: linux-doc@vger.kernel.org
Subject: Yamaha Piano 10/12
Date: Sat, 12 Oct 2024 17:58:36 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I?m offering my late husband?s Yamaha piano to anyone who would truly appreciate it. If you or someone you know would be interested in receiving this instrument for free, please don?t hesitate to contact me.

Warm regards,
Josey
