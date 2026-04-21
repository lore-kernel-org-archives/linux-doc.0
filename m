Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7D39B965
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760183; cv=pass; b=iWUGz4o7IfzGcRxiAJ9R+oDKhqyQbVngjuH78uKBZdvskq78y0jIVHLsVnxnF2aD9YhwyIwNlnj5u9NLHr7o3zQbGZOZqlkr2oPf63w6f2J2sG7/zuY3HoJ9xEma2Sa7U5mQDCod3d4rODfJF1RGIsoK9SJR0VaGoEuhtqVVLBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760183; c=relaxed/simple;
	bh=VmCa0w61OkMEnKKTodFxVw5pyBCXmkzpXCWn+msH7do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=muyqQjNr+V22iH+xMtj1jIQltesE/7M52R8xhmbWP74b1bnpn3UlzQQkK7pZ0c8tPbnOuyV17gX1R9Kx8fMSerf8JgvRCHH2SLv4k7x9n/d0lb/fsQU6quW/RAN82RMNi4rU6f4Xp0YZgk7khtkZjodeDMyHO/g9MhJ+oJkviK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VvSWt9Vi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmPllE2y; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VvSWt9Vi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmPllE2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776760180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
	b=VvSWt9VirbRN2G93/T0YJ2WkqsMg1UWhcyRKSgCd4NqJOdnz8IEms2R1T1ZIV21+gdqG9w
	CxGz3FLswhTQw08TOmwyFBzAzEFU7wi8pQuTvPuKhy6KvneHHcBqA6GYB31/HtNeCgOZ/K
	QxGGtJHA0ALt9ncV4QqKgiCL57LrUzE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-x-gtfNeOPgmCN3vxzv6ECw-1; Tue, 21 Apr 2026 04:29:37 -0400
X-MC-Unique: x-gtfNeOPgmCN3vxzv6ECw-1
X-Mimecast-MFC-AGG-ID: x-gtfNeOPgmCN3vxzv6ECw_1776760177
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7a45cf7ff24so64534997b3.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 01:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776760177; cv=none;
        d=google.com; s=arc-20240605;
        b=bjedMk2bFbiWuYY1+7BtUCIJkoTW8c1dv7Fjd/a8s24RsJhgGxGKcYQ15zwwswdgyI
         FuNRP8MgpmTgumFBTIib0Wls3uaivvGMsAZAN2DRK/p32Gs4qYe3zuFpS9uRVqc75+eq
         FprPpw7dwDUJYk+/oeUHk4l+7oh96EL6WbzyfPmb+mFOzUcy5IWzwCZT91Xej6FnkHfW
         nbpCQ4sxsLZdKqDwXAO0po1exNqSYjFC2TLnkmm6DPUKNvmaXY/9Q3XUQfuCCtIKTMlc
         XuzGGdpspH5tDy9l9co0jdeyYGe1CmRhtLkWC/5gANdmtLJfJXZS8/b0QciYrFWyLrcA
         ipTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
        fh=YRM1psJ3f+5z0iw5Ss3fGX++YDV4OvnJ3s+5DR3Tb4Q=;
        b=l3PzQtCWiSeoXnpHjX08lmX7YGyviX635NX9gVtkfuSLuHXF3UiKYpy1xvpZisZ/eo
         ubF9HsF7w67iMuV9T8oAAuzCFJbZc9OLc7Rw125Sf4cPtYLP2VXo3PcxiVvknWCEUQOP
         rCXl1BUgIY4xpnnYjUGZ0kYgMZyxFYigsnBktq1f4Yv0JCogcnQkLg9ViwLFPx9G5RP5
         xVeL3DKQGHLYFNdlOfvJ++QxTOIPFL0x07mjYo0j9y060FbbvVeJ2EArW97aEqQ0NLC2
         xg3UsiGmX4iKnllIKooOPQovIAGrQHjDsLxu0C6pgh7WEMo6diTb19YYXlK80zOX7zgr
         soAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776760177; x=1777364977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
        b=ZmPllE2yqOnE4NFZUcU5mCDLTCf9hJPPseg26gDq4NdTSCqBYnqxuoYrTotCpQc2fD
         Kkidt50vpDEGCDwWwr3wDU5q1aavZPXhlBul/EmqkQmJhnvbLBQsMiLrCyDtr4VR7IRn
         24LoiPP2tm5lfkD2r9jruQelTLhvcIKH6pxhtqIgi3vQbjIc7JYlroCPUyIEK69NU4Oj
         Oq3RxiKLTEFOH9pbNudLSYel1UdWoOORRPBdG1RYESQdoVAa7d6Q8+jpbqxyBQx2nEL4
         iHtu8+DQGaff3KQBNbrXnP+3m/Hf4YFIE+N7XTCkR3Kt96H2swj1z/9EMhHTKmYbNBu3
         ZkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760177; x=1777364977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
        b=OhgVo3NKozqmMxipjweXONz2ngwNZbJh37nkyKDB8QDzXI/kXD5nZYcQ+ApBksPeNl
         ui3YYYADUnRIMnyQWn3uESU/4oNg/LvhLzYpW/C4vZ6DxDYVsTcmIavSLLYYJZfSHDUM
         QEn8k+jwhkDQO7xxLjqD30HPyXBJOOYtpiL0XmTtnAnqtt+Q9ITK5o0YRGfrydZXY3V6
         WGCBDgz7JdaVFTqRQroJClYslTw2mPX5/XjfhYO/pj4LYR/DZ+z5TabegQYlUdgHSNt4
         bkJiQIqbaeltcYKqtDV5VMh1PkbytxHpRZ01e2qd18gkHU14HWe4SvNVXkkCCfze67X3
         3orA==
X-Forwarded-Encrypted: i=1; AFNElJ/mxo1hbMsus2uNlBM7mZp4dId4+cbnJFvAqi1DRgGpFabdJsuZWtikQow3DJj3/1ErzQ4+exkjCF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVFu6QG+FRpIaoNiqcR29jZlUlFIzU2N2GjJzJqwkoVP8rsfnH
	YzPdy/KRiJBJ6/HR1iHzB7NVFDD1Ft1jQctWwsMqRS6cBdLv3Qn1g2kaxlfQ+JC4Hz36lIMqJKt
	6GDN9Q5GZqm6ecCdsMfaSUoTaFLKz2JSw9SJ7By4BS0FMJ4ipenQ0YO9BiLEsebfVkaIBhiYxE7
	OlgjRlpHbSdh171r85O72djRp0zOK9WCSjTt3R
X-Gm-Gg: AeBDies1PLSs0DFAZXStwfbQiqOwZHpXmTNFAJKwtrYXdRaLPwmAiAdl22g8n5cHMkA
	24KYGQbz8+sBDZ6WsPe4NNHYqinzGuutHydcbezLVyPBDORRiRqmNYbvydCseRORh2nVLJ9mb3E
	E3V6w9ZWoHTDv+S23Hf1ku82/yG8+CHXZb4yGiHTl+FnNheuMJJHXrVDRzhU71HRGcbxiM9Fdtq
	u7kVjK+iFKiUDkl
X-Received: by 2002:a05:690c:1a:b0:7b1:d1af:4b95 with SMTP id 00721157ae682-7b9ed03ea4amr180130487b3.45.1776760177012;
        Tue, 21 Apr 2026 01:29:37 -0700 (PDT)
X-Received: by 2002:a05:690c:1a:b0:7b1:d1af:4b95 with SMTP id
 00721157ae682-7b9ed03ea4amr180130217b3.45.1776760176561; Tue, 21 Apr 2026
 01:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-1-e8bc6e0f70de@redhat.com> <20260420144512.GL3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420144512.GL3102624@noisy.programming.kicks-ass.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 21 Apr 2026 10:29:25 +0200
X-Gm-Features: AQROBzAEAbEFlPw_UOBBc9Hp9GuZ76mdLqLO_-KNOSIDgp6-Bgs3Cp1G00-BX1o
Message-ID: <CADSE00KyJhzf_p1Z9qZ-PRi5_9pEhSxHnP5wy+kdxexB2a2scw@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] bug/kunit: Core support for suppressing warning backtraces
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Alessandro Carminati <acarmina@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:45=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 20, 2026 at 02:28:03PM +0200, Albert Esteve wrote:
> > +bool __kunit_is_suppressed_warning(void)
> > +{
> > +     struct __suppressed_warning *warning;
> > +
> > +     rcu_read_lock();
>
>         guard(rcu)();

Nice. I saw plenty of examples using explicit calls, but I had missed
the guard. Thanks for pointing it out.

>
> > +     list_for_each_entry_rcu(warning, &suppressed_warnings, node) {
> > +             if (warning->task =3D=3D current) {
> > +                     warning->counter++;
> > +                     rcu_read_unlock();
> > +                     return true;
> > +             }
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     return false;
> > +}
> > +
> > +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> >
> > --
> > 2.52.0
> >
>

