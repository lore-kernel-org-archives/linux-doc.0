Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E3433B966
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627309; cv=none; b=XA3Ej8EQF+Y/hYoLQNy4QDA8calWdwSXONzvFVWUXQV9dbcDtabMqARDpXFBA6A1q9MD68I9dyHE+Lg8c4wUyBDIx0s8P9HpUntUeRRgamQFcQJxVsMCqFPjLC7h6AfRPcfDLl3BOTHeI8uHgIJDPUkDagVKrRgUVMbptPCAHBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627309; c=relaxed/simple;
	bh=X5i2PWRIsarcjL5H2zSKWHQQT9H3uhcZxxdmJW5mvyE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mjb4txcrD+hbaBjaBvl3UQCHkhM8VVjfaYhJaOLX4ozryO9bcR3oknX1n1IDaaLfR1cmFc0jdwxzYy2MEr17l/kiB5s1dAeEv/IIRcHvNBiFC2uJo7NJuYVeNROgeZINxZiQFMwS5V7qyapOhw9ryIfMGDTWYKRtouxDQ3AtdD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FmgCG5pQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VCHDr57f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FmgCG5pQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VCHDr57f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774627303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X5i2PWRIsarcjL5H2zSKWHQQT9H3uhcZxxdmJW5mvyE=;
	b=FmgCG5pQUKV3JrsxCE8KsVad5L/Y5IIaZjonP2n8EyTy3JssSZbt1TWegBDvEp2gaaWckR
	n3SP9DTExvt74IutWet18oLPShqhf8UvbFBKD8vIre028lzB5i1X5/pWiY+Xizu5ceIaAJ
	YtrNcBysdTG8xsn8h6enZP6coRYosjg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-8uacFxZON5qwP2-1HHYFmQ-1; Fri, 27 Mar 2026 12:01:40 -0400
X-MC-Unique: 8uacFxZON5qwP2-1HHYFmQ-1
X-Mimecast-MFC-AGG-ID: 8uacFxZON5qwP2-1HHYFmQ_1774627299
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8704795d25so241954866b.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774627299; x=1775232099; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5i2PWRIsarcjL5H2zSKWHQQT9H3uhcZxxdmJW5mvyE=;
        b=VCHDr57fzJ9jbucU+SL5EgQocnJ1XXkxtCwHHQbd5eIyEK6shqRGu1vg1JGHXdHbDE
         hsrJOVMy+KNbj1ofIIfFLjlE5qUkpQu3RjQRfbKhDCd3a2P7Nvc7I5BdEBKrTOEKdVri
         ZiCiOOAtFnjitOW6S85O6pkJ36OgPbxx/WqeK3i3ouuGOdu1V5o3KfYW4dd0k+sDaEIj
         WeDdryJzIiOJg3ogaOiMacCwGwvQ4+gY2uWqgm5659/D3sOs7A+MfYXNvLSOBCN4F4M3
         TUmIWI+vw2XJDfuEK1RPvoH00AR9TVTwmeZ3hc6uZr9VLmcjXh964ZDxKo7fmFMyaR0l
         A08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627299; x=1775232099;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5i2PWRIsarcjL5H2zSKWHQQT9H3uhcZxxdmJW5mvyE=;
        b=fb7d/ddMThlbk99rcH/DrqRtG2e8kSh1Usnzn0BQvcFQWOQddQR3sMiF4ceLo4vQ7L
         oHIyrZVqYfb//UDjiQOxTdBGX29VigDApmhImUiWSn4P+0XXoxkFlLqNtFP3pmvokW1b
         ss0MLNDLK4o3xkMZ+FEH/9PymiXokPEcHDcwfbGEy450DSYqK59vd4SwCtt98y8P4xnF
         sEHp1rWB82jjGDw/zxJN60v4tkdF1z70pxy/82fO0vr5Mz9gHLg/OO8Om9YuXwL8jSbm
         0MDM1F0dbjUiIgxRx0zEDTHlhCkEhNx/SqdaHo5hjUAKRycJjCdo7YGx/THifIP4JV7s
         bjuw==
X-Forwarded-Encrypted: i=1; AJvYcCXpBQlifi7IBrSv6tc0k7mM9k4+/wJBcF5ahEhH8rLM116oNUhV4sIwx3hFmbj1lWN9Rk0MYFZKOR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzd9y3Mi5owg2AYCX8j3Vy469cd99uiTEfBkjs5J8SDARetgRi
	ShXoB+WD2v6VZEFXykG1XP4Kqrsuht3jfGVRSs9VHv58zYLhsBPZtao9s/ppHqBHqmWp/MGAeXH
	LdkYt032B6emFNW39ttlLfxT915cukCF6Fg3hSKCm9YybUfZzSrmzaUJp5SmbThMKqOMXbg==
X-Gm-Gg: ATEYQzwbQmJ1WQmm0hQm5QPBvReoZ+aauDomFWuIxhWMmVsSUY7YasRkMDj6iHh2l1X
	r9CU3XkDLdPg4ImNhQZdf38ueOS1LiyGluKjLwsaD0ryB5ZlWlYluCIARQI1aNopaXKKKjPLMHe
	dU3NOnc209uy2XVeMV8LS/++hWMy8+/vyoxGraqhI+8K6bc9wZFF517gSgo56Srye/hVU4oSnZI
	iZeB2ULOoigG1qIuTzliY7eIoq/VKxNW0ZEN/JVf9PXUQ296Vk6INFNQyUq6/X4gyC1Q4UzO9VT
	QEXI0rYCkmktmTiY2PQYYpdJMJIq9vlwEW2Iv+hxOLt7hFcFBHNMxQyQIpqcX9ukedRpHBAAr2E
	qRQcx/rxa2bKgTYMtf87VwoN2WyBvQ4oLqy1kIqChADAhVsRKdA9xSjwBGbOQkxVQK2658YhVa1
	uP6cgFaAU=
X-Received: by 2002:a17:907:7b06:b0:b98:443:6f33 with SMTP id a640c23a62f3a-b9b509a1d23mr202511866b.51.1774627298615;
        Fri, 27 Mar 2026 09:01:38 -0700 (PDT)
X-Received: by 2002:a17:907:7b06:b0:b98:443:6f33 with SMTP id a640c23a62f3a-b9b509a1d23mr202506566b.51.1774627298104;
        Fri, 27 Mar 2026 09:01:38 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919588e6sm14987755f8f.16.2026.03.27.09.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:01:37 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Gabriele Monaco <gmonaco@redhat.com>, Ingo
 Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Marcelo
 Tosatti <mtosatti@redhat.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Michal Hocko <mhocko@kernel.org>, "Paul E .
 McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Phil Auld <pauld@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Waiman
 Long <longman@redhat.com>, linux-doc@vger.kernel.org, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
In-Reply-To: <20260326140055.41555-1-frederic@kernel.org>
References: <20260326140055.41555-1-frederic@kernel.org>
Date: Fri, 27 Mar 2026 17:01:35 +0100
Message-ID: <xhsmhse9lfehs.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 26/03/26 15:00, Frederic Weisbecker wrote:
> nohz_full was introduced in v3.10 in 2013, which means this
> documentation is overdue for 13 years.
>
> Fortunately Paul wrote a part of the needed documentation a while ago,
> especially concerning nohz_full in Documentation/timers/no_hz.rst and
> also about per-CPU kthreads in
> Documentation/admin-guide/kernel-per-CPU-kthreads.rst
>
> Introduce a new page that gives an overview of CPU isolation in general.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

With what's already been brought up:

Reviewed-by: Valentin Schneider <vschneid@redhat.com>

