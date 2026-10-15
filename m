Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9C345560F
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 06:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044542; cv=none; b=sN7xZzueDVYnVA0DelSr9THJA6JRbPe3JaQVplHkXWw2yh2yqqrH9xLZSxcIFCoovOGMsIiGg/MFHlwWZ+dfVhYL9GdM/o9ptlwI/kuuJUTPBVfkIlr5r9qZf486JxoOSjXfQR7nUzWJChBgYHHWE+dZw7h5TTwG68a+fPmm9Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044542; c=relaxed/simple;
	bh=aMsuVaXWH1b8osllmjJ1hmgRkfZ+5/T/2kOdW4StroE=;
	h=In-Reply-To:Mime-Version:References:Message-ID:Date:Subject:From:
	 To:Cc:Content-Type; b=XFpl7TMJmmeyxIIdRinsDIhlbUnE3o4uoONfO2FFmFGTlKHDb+TT3UhSK7VYDNdYxLyEW/AQTq0ThXokFz28OHnKx0luBkduGrdf7Oz/XSuvOYCDG+WquMc8b5SSDdyJiX+g5OPFPxJqTBkzhQbaBuhWxDL9PJuga7Phmk+CdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oqVnG5Z4; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oqVnG5Z4"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89eb8443c26so24280b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 23:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792044540; x=1792649340; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aMsuVaXWH1b8osllmjJ1hmgRkfZ+5/T/2kOdW4StroE=;
        b=oqVnG5Z4kRcSXU0ACFWV6OMIdKewRzW20eRe569l3LqYzCZbymc+lcyWFXMEPRjx6S
         sL3e99JhOQ42Njkgy7GfMJEj67EN3sUw2gQ5ZvvLklBrcZ1xLid4+rA9KQCy7IkiARir
         +559tqnsYvOiulPKYzCW2LqU+9xFo03G2A9psfQUVrZeNjXhfTeJTowzZv+NPaWOCe+8
         3lQmggivAUIvD3slx7ndGPVZoYU9lQjoKkIuACisIYVQfNYrlpfbbwemFbR1T9tg0dU9
         fF5afjZPSFIckNaDssKksJMgGde7w85ECfX+W0rSJCkV4HbI69JDIRHu+JMD7BmxZYTm
         s7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792044540; x=1792649340;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMsuVaXWH1b8osllmjJ1hmgRkfZ+5/T/2kOdW4StroE=;
        b=LfuwzozhgWEugXnwa3WXQENJDGfLNC4ic163TsH6uQX0KJoDeF4an+QT6h5JulRm3l
         9lkEV5GkRK7tUW3D/LRgLBUKnKnZVTQlWqKGWoqA96b7cWlvkgyX0wDlDLs2y0l5OABp
         g8pnbNIMaKt663VjPdWUAg5HhmGTq1XC5KGVji2HBzQob6kyEqub4g/pRPSuwHyRzm5O
         EQ7cy3DV6cCuF1MgIbvD9SbX+JCcwVRwpRzYYGGx6NljmdjsIVQLiu6d1c9ezkg26KyK
         HlGCHHsRYQO69gpLx42LXUilABA7nNmaPRA79l63hLgWJjKGSVZ5QfPjiRrIUT4RTf5Y
         SuFA==
X-Forwarded-Encrypted: i=1; AKwUvBzIyiUTEKjSffwZv9kcJCWOauDXJjY3/iCsoGhnYF3thy7hCscC+hqOx4pO08KbqVzwEAt3bgER7tc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcZxvOfgx4wFmgOKydxdSoNtPDXvAIXXmh0ZZSv4bM0vxdX5ZB
	JmpdsxPXQzhIZPQ6eaa3KPjEYIjgn9ejPKRgKRcf3xoL5QMEdekRafoyJctZf+u/iy2tZeqtNjr
	nVjjMKvhjJgvYMa9lgmus/g==
X-Received: from pfnf23.prod.google.com ([2002:aa7:82d7:0:b0:88e:c0e0:7ea6])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:88c5:0:b0:899:a361:ed46 with SMTP id d2e1a72fcca58-899a361f1bamr12086714b3a.58.1792044539812;
 Wed, 14 Oct 2026 23:08:59 -0700 (PDT)
In-Reply-To: <db212304-4ae4-4b5c-a39f-74c3f0b7d791@acm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012120059.1371653-1-stanleyjhu@google.com> <db212304-4ae4-4b5c-a39f-74c3f0b7d791@acm.org>
Message-ID: <18de9f03a5560051.3137322e31362e3131332e313435.544be.0000sendgmr@google.com>
Date: Thu, 15 Oct 2026 06:08:59 +0000
Subject: Re: [PATCH v2] scsi: ufs: docs: Describe how to test with QEMU
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeuk Kim <jeuk20.kim@samsung.com>, 
	Bean Huo <beanhuo@iokpp.de>, linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On 10/14/26 6:14 PM, Bart Van Assche wrote:
> CONFIG_BLK_DEV_ZONED has not been mentioned. Does this mean that zoned
> storage is not yet supported?

Right. QEMU's UFS emulation only has conventional logical units today.
I'm preparing a series that adds zoned logical units and will post it
to qemu-devel after the UFS patches already queued there. Once it is
merged I'll send a follow-up that documents CONFIG_BLK_DEV_ZONED and
the QEMU options.

Thanks,
Stanley
