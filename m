Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3662FFDED
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661066; cv=none; b=cjexkHcJDMl/k32wEdR2erBOjS2bryLnGJwOogjdw7kHV+R2I/KSfckqyTcNUUCSLCOymvPB/i+wQb4kT3T3C4Ed4Mik9JZCTDd+2NJi6oLMFb7jAV9anBMdX3yaOhxOPLGMwr7k5ppdrYbZpyLLkxF+81sHtOBNvc+fhxHwD9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661066; c=relaxed/simple;
	bh=rJUxGx2aB9EDcv9hfA7ubJd/ff7i0tqlXs+o7pLBSn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6wL3HoyWS6aPgCQMAe8rDQg1sUZzyg2yrSDvuY2+hjqSd0kPKncMHpPPgNKpM4UbfQcFbKVC+d85OiIZs4wlKnKSGHXz7cXsZLoYApisjJ3SFnKR7Awt+Tp8KWcUwsiyOyc3btDeBFvM1M8m2WXfdriH6vJihJtQ2S+7YAnssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WM2g59Kv; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM2g59Kv"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b1e54aefc5so370690585a.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 23:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764661063; x=1765265863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uMUqOtbQRuBycaLGOZXvsFQQacfvpLgzgzobZhOZjuM=;
        b=WM2g59KvEOgZspi+whBU9+53EPQMK8pQ3jXlw5ovgKHc1XGx8HhTm99iKlIg5APOjx
         qUTwz8GxOhVZ5flr2jKgqRbo3ditYkSocbTDTk+oMLhiyk/RD/FiLWDQHarpNclmwyzt
         uF6Lf/uJ5zJiw5zu4RbezM6oytq3vVOLjrwqKInui6zWETav2PzKkNNwDQyb5hgNT3Sw
         7J4H1kYBAAwcx/7coaBfrJuFkUF21WIRiOyb4fo5wjjBLi0AGCKQLa4JIgqSbrjrCa65
         kNCc5PpXFRSPoDx0kyj5ObYqq4eAZjCTahOGi6neP6Ac2XXUHvVHrpSOr+IDp1SDUuS3
         HkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764661063; x=1765265863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMUqOtbQRuBycaLGOZXvsFQQacfvpLgzgzobZhOZjuM=;
        b=wTVzAnYq/8Jdm+3HD3CGK1hhbfrmNDNin1bpVHvErKlekDNQOyhnwHAfq1o8lrnNBg
         tH5AmIW0dp/qGgbPH0BTieXrKOdaYKDRnr9sdNi/oRoPIh4nu1iU73HCHtMTk67u9M90
         1SF4yhOPVvtDyoqNLzlBOx7TfI5l1v3VXtm6xPT6f2N908QobWCmwAhkbavAang7jwAk
         pBzSj05oTFbG6XTKn+6UNlX+Yjk3lZ7Hdftmwm5K2zP1awkQUPUh77KJb7LZP/ooomCV
         groJuc1OpeQtT0k/T2T4frqvaL1OYpA26kRfAyAjRs8HaXOEZ6wGHn6qTFocW3pVwJW+
         JUWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7FzLlDkgPI3S7vO2F06c5FmTLJz7Ke34ITcR3Uhz/0Vzuqik2QdvgEtuN4Z7me4dix9cS1n6umSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzeCf9huCJ612/t7JtW+Cb+Q+JqVPGv2L0csWDAYnhGAwGjK30
	82gDJHiDU54e4D3p0ghuIZHMpM2Ic3eWsP3Yw0N/zSW75owuWZpl44f4BF4dKWaTbCBG9yBwNkW
	tcTpsHwWk4NBSp3nRTVFDb0FDiiFtVIQ=
X-Gm-Gg: ASbGncvqj7xTFmDO+/eLVjLEpkbNHC+D3z1PsZb8jzdTe9yArJ7AK/rNr9eEydo3kbV
	3DFT/211pxKp8xAAq57wU80wmiGdMOv2LcFasmHxQ6XQ5Cu5AsPQMIcDZZWUZHLJNaZFwaAjPkS
	hwDkJpalke+DB1GJyf+M+PzdTOYcyGOKLxNDnGt4NYtAijTKRgMsnzI4LNw+HlWHv8+iXw4Hf4b
	7dczXn/pXHq9j83R+ddRf3g/1XozDkSxtFwQTd7xegEHUlCAP3SvzpHrr0vNwQw/x/l0M0dRnJ9
	Fain
X-Google-Smtp-Source: AGHT+IGopKlmXLCFS1fuJTBQDpmGNuHcj1qAM5tdnHITeRvJEMu/jP7kOUGnQ1XvT3kDhIqVYBpkKESEJ61Y//iTWms=
X-Received: by 2002:a05:620a:4492:b0:8b2:735b:973b with SMTP id
 af79cd13be357-8b33d1d0e9emr4997633585a.23.1764661063253; Mon, 01 Dec 2025
 23:37:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107135701.244659-2-phasta@kernel.org> <c35026065b1d109b7f4b9e1d8dee8ea45f9a1dba.camel@mailbox.org>
In-Reply-To: <c35026065b1d109b7f4b9e1d8dee8ea45f9a1dba.camel@mailbox.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 2 Dec 2025 17:37:31 +1000
X-Gm-Features: AWmQ_blLBdudWw8MvRxu2fQVyMFReBG71QSBVpfR0YW24N-X61nRZ4UlCjTmc0k
Message-ID: <CAPM=9twe+Q0pP3KiWy7ZTYxRs_yN1bHEto6Mptqb3ub7vimgtw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/todo: Add section for GPU Scheduler
To: phasta@kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Matthew Brost <matthew.brost@intel.com>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Acked-by: Dave Airlie <airlied@redhat.com>

On Thu, 27 Nov 2025 at 22:50, Philipp Stanner <phasta@mailbox.org> wrote:
>
> +Cc Matthew, Tvrtko, Christian
>
> On Fri, 2025-11-07 at 14:56 +0100, Philipp Stanner wrote:
> > Changes in v2:
> >   - Fix wrong list item index in patch 1.
> >
> > The GPU Scheduler has enough problems to be covered by the drm todo
> > list. Let's add an entry.
> >
> > This series is the succesor of [1].
> >
> > [1] https://lore.kernel.org/dri-devel/20251023143031.149496-2-phasta@kernel.org/
> >
> > Philipp Stanner (2):
> >   drm/todo: Add section with task for GPU scheduler
> >   drm/todo: Add entry for unlocked drm/sched rq readers
>
> Can someone give this series a review please?
>
> Thx,
> P.
