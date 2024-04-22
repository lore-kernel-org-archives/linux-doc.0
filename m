Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918881474B5
	for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713788591; cv=none; b=awUwj1jv9ImXYsAJ1X9bTdf8lARb15Ju/xrJrK9e1sXip7k2AjpW07cB/l+tRgPEK5P6dbbpVPyvX7JaafumDDKKfjTDJ07CG0SU/UeqAngoL+Uk6v64K1fAc4fxuBKHgcFQ5c5TT5iWaDZezT1tBnvb9A5yHbvdAotlfxzU2rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713788591; c=relaxed/simple;
	bh=F7obnOZNB7/UePlmQ4/swyiJSlSeyZSBbGTCgkyWlp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbNBrYZV7Bz1KW72AyQ+2k8hoJ83laczkdZW/7vasQcBQqu1NSbqNQX2ATWCFJ8M1Cawk9L0UcoU/6VX2ozSZUhlKxjl4P1OO815B/VRpDlhQOkfAJzrnZH1ObkHW8ORZaH4+59b1QpBfMLC/iBAqBUXvhCvMHjfBwzhmYE6IZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RgzgoQQz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RgzgoQQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713788589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/ezKDbA2HN619P+c1weExzZDrmAB50w8fBX12Fo+H4=;
	b=RgzgoQQzTMOZ7aVHY1hTqMOIbsOX7cPZUIEFkvzihFfkjBCNjmbFTyLnmReYBMVpkCRRoP
	bDwQ30ek7plDHfzRqtNHga9w1bmm4wwuVVdvcndoIiuPuzB+tC4VZsq0WKBNXGg2aTL77O
	+LSfHWrbmYTUkv9fO7zKpX8zkUr6Rck=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-vYjnkRvEPDeV6DrbyHpFUw-1; Mon, 22 Apr 2024 08:23:08 -0400
X-MC-Unique: vYjnkRvEPDeV6DrbyHpFUw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-419e3f83aeeso11432385e9.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 05:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713788587; x=1714393387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/ezKDbA2HN619P+c1weExzZDrmAB50w8fBX12Fo+H4=;
        b=rMNfAz2v1mNBJgqGu6bnKgYr/co2EH/ihji4z1gepq3A+HxIoALuDGWrRCfpcm8c9D
         Eij78x+OFx4S5A/rWIzkKEADqv7tSr3w77MeC+0sa+/4KCjFJUZQv+y8PJExso0VpR8T
         lLrXfGZzN+ondNAo5N+OhjAfelSvru7LduSP8xgKDnd++3yS79lco3SeiFFVnAaQBa/q
         yJ7ad6qV/TLPeQrtV4LMjJv0B/zOFC9W/uxEaUBYg/rW0m0y2Lf4oVj6f0ukQ8PU28Ee
         smKkf6Jp8lKk5usyUTIoEgzGhXTNjButZ4ViPf5BeEtZz0IqlwMssw5imUSHdPwUNjhg
         K7Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWzZZFQHEucKnL1+8eeojsbFeDdJpVQW5QMZgnhWw7w5ETzWzueYFyQbzXDa5Dmbt9jziQuSVFNmPiGAS+g4+6fFLtQC92HOe+7
X-Gm-Message-State: AOJu0YzoC5cR1MlXr2T677IK9gTcTvf4jkB1HqSRp1l1Yq9LhQ7y+Jzt
	G7sz6fC8euRvXAuoIXNoiIQzChKRpXGhay8nB93A81gh+AhNfHZpZWPVlK5xzx8iJUzy8iusoyw
	1hERm5p9tZ8WT2oBeX0hULhz5gnqC1b8PrSUebetvZfFFDNMeWow/jbf5VHAqxgXqy0gllXTF9k
	HLIfK5sFC2+KfqU9dUbrXwsL3s4yebybym
X-Received: by 2002:adf:e912:0:b0:34b:4d2e:47d4 with SMTP id f18-20020adfe912000000b0034b4d2e47d4mr500947wrm.24.1713788587154;
        Mon, 22 Apr 2024 05:23:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3h4OmL+jYFXwcCkMIHWemcojF5sGIioXy21Ag0m5VdsfhXioLRiKuxM9attN9d1n5rFQo9UJTzdn+57ydq+I=
X-Received: by 2002:adf:e912:0:b0:34b:4d2e:47d4 with SMTP id
 f18-20020adfe912000000b0034b4d2e47d4mr500928wrm.24.1713788586839; Mon, 22 Apr
 2024 05:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418193528.41780-1-dwmw2@infradead.org> <20240418193528.41780-3-dwmw2@infradead.org>
In-Reply-To: <20240418193528.41780-3-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 22 Apr 2024 14:22:54 +0200
Message-ID: <CABgObfa0j34iEh81hhd7-t7ZM1GKAsvJb5xP6EoD2-c-8TnPqQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] KVM: x86: Improve accuracy of KVM clock when TSC
 scaling is in force
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Durrant <paul@xen.org>, Shuah Khan <shuah@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Marcelo Tosatti <mtosatti@redhat.com>, jalliste@amazon.co.uk, sveith@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 9:51=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>         gpa_t time;
>         struct pvclock_vcpu_time_info hv_clock;
> -       unsigned int hw_tsc_khz;
> +       unsigned int hw_tsc_hz;

Why not change this to u64? 4.3 GHz is scarily close to current
processors, though I expect that it will break a lot more software
than just KVM.

>  static int kvm_guest_time_update(struct kvm_vcpu *v)
>  {
> -       unsigned long flags, tgt_tsc_khz;
> +       unsigned long flags;
> +       uint64_t tgt_tsc_hz;

... especially considering that you did use a 64-bit integer here
(though---please use u64 not uint64_t; and BTW if you want to add a
patch to change kvm_get_time_scale() to u64, please do.

Thanks,

Paolo

