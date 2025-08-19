Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3F4322C8A
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600409; cv=none; b=hM3iRoBTL6IOOpNIeS9nxCQ39K1hvIo14Xwoor6Wrref+Zd911dlRZGVGdOQtjoQhipr/AJcSKzR3fuxfy3S/dIB0xLGqGrL3sbcG+pvceZr2Pw3bKABeGuFOjtr3flLdfMavm9kvhxl73ZueZzep4n5tco01GMShdtP8g59zl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600409; c=relaxed/simple;
	bh=mN4W5lU/nYDZ1u4qGcbGFkkHXrasqWu0B4ILcHlhbEQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iiens1Bq3SB1U6OjSp3dW6BNbCNo1ek8BubV3ZF1csmOVnX1tyJaH/UFshLsDJtXVkDaHch1XnM7jgtZ/kRddkSODdGliHjAWImRULz5s12+WfA8y5P/R7So+H4NR0EtDUcrP8+2vtYtT777Zv7whJ6uOa16khvOiBMkC5/vOu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H5ho1qPD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5ho1qPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755600406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ya9rYpVnEq1bqrzAsmHksoTnC8P3FflAlqr+wlwGFI4=;
	b=H5ho1qPDVyYwC1o9PGKLC3gCS0J+oqWRWQZUXEYbL9AcN35cVLo1HJb7Ac8OoN0EnGZa0V
	Ba4v8a2Pz8ENvy3wXct0AIJyEANLDR1CSbHTntWxpafcWaCUJ1zs/O4R3LMZ9i5GrMbHQk
	v7M2RxhHR/CY0UJsH8cE7hHW0lDUudo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-YcOkD3EQNraC1q-uqsghsQ-1; Tue, 19 Aug 2025 06:46:45 -0400
X-MC-Unique: YcOkD3EQNraC1q-uqsghsQ-1
X-Mimecast-MFC-AGG-ID: YcOkD3EQNraC1q-uqsghsQ_1755600405
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e870316b85so1235554885a.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 03:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600404; x=1756205204;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya9rYpVnEq1bqrzAsmHksoTnC8P3FflAlqr+wlwGFI4=;
        b=FuDd3GdaWVKyDRiHDwh0THyqsk+yI+T25D7wx7Umkd1I8+ICVfBPlDPUCgAZCYYzTK
         sXQhgVONU2+RtEd4axnF/GhQKsnCRcE2DxnxAk0FtShgfCYxXrs4CmVoU6D1KvvvrVJM
         OEhWiOjx5SYWqSQYBADa2Raqg/AkGvZcuMdgNAVGJ9IVFN4chh4O9jhoUe/Ovy3T2Qmo
         yyj0gwZQ7GcHGiwUIqwZTKnx+U/Gvqcq1yJQcTYcAvNr+00KNuLf91/+aV4x+0TFnhfY
         mgeGxA15tbj3gkdeBpE1jJQpl/Wda1RVkv9Ed9IiH86h4O7WXOSty9BqhZzWzrgUCEzm
         WeZA==
X-Forwarded-Encrypted: i=1; AJvYcCUrNxAbInji+5Lp7C7If5Dw2lLaJI5XUfdKkeiYtitwoOO8++tt0uSC5Yivi+XXD42/pYPuCmqvRw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4sgUaY0AB2mpA8+ijFnQrd1g1dGJ+yagbTH7bWx3DPSLswYCT
	Wwxoi7WeDwu+P3KiHCGWyFoxl6ChZpT2HMfXTzZtpKXxwO++xi5PVsMr5UNyooXFVgeLCCWDEF1
	Z4D+FDZK59/O+JxP2fAITA983dew+j7uleYjrjfhEyrOROC2ko2CEJ8DTkHTKyw==
X-Gm-Gg: ASbGncuGHA6WV4OW72YnSDUAlKkimu/a6nr1/3XDIB7qLM4dJqx8uwMJNFok1kHIB2B
	FgoQeJWsFudU/Jjb1QtVBGthVPDmBXkpEhFVwgAUGBUsudHhpn5MiKpRhJsAsGKEsUqvH4syWzw
	GAB8eYKNqcoMqOole/vVwTddLUXoqOHzoO0De7zIdZMsUG8fjFPlrKgWoQSP5c+JiyhUBFq+50v
	8uQOVkt0rZULie+iF/UQjMH/iZwEH9tjBBkS+gyQKn263N90Yg7tb3pFmDeOgustOaAe7tegXXB
	0TcrYbIvzDlUy4CJr/h23S2e9qM8HDQeb+vfW/XwNlgQpDqF2GoHBAXVRr8z8BgLLw==
X-Received: by 2002:a05:620a:17a3:b0:7e8:34b0:6e07 with SMTP id af79cd13be357-7e9f330d21emr238065385a.7.1755600404702;
        Tue, 19 Aug 2025 03:46:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGePi7pyFUeDcLopu06z03bZieJKd0N149MulemJ5fyts6v+HbKw6uGpTSN7vDff4vEX0HHQw==
X-Received: by 2002:a05:620a:17a3:b0:7e8:34b0:6e07 with SMTP id af79cd13be357-7e9f330d21emr238063685a.7.1755600404307;
        Tue, 19 Aug 2025 03:46:44 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba95cd49asm66838496d6.76.2025.08.19.03.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:46:44 -0700 (PDT)
Message-ID: <2e4ee3715146262df549b177ed6534129b827f09.camel@redhat.com>
Subject: Re: [RFC PATCH 11/17] Documentation/rv: Add documentation about
 hybrid automata
From: Gabriele Monaco <gmonaco@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet	 <corbet@lwn.net>, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,  Nam Cao <namcao@linutronix.de>, Tomas Glozar
 <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>,  Clark Williams
 <williams@redhat.com>, John Kacur <jkacur@redhat.com>
Date: Tue, 19 Aug 2025 12:46:40 +0200
In-Reply-To: <aKRAeOakjiwmgML_@jlelli-thinkpadt14gen4.remote.csb>
References: <20250814150809.140739-1-gmonaco@redhat.com>
	 <20250814150809.140739-12-gmonaco@redhat.com>
	 <aKQ7iaSb9GGUtuCZ@jlelli-thinkpadt14gen4.remote.csb>
	 <aKRAeOakjiwmgML_@jlelli-thinkpadt14gen4.remote.csb>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-08-19 at 11:14 +0200, Juri Lelli wrote:
> On 19/08/25 10:53, Juri Lelli wrote:
> > Hi!
> >=20
> > On 14/08/25 17:08, Gabriele Monaco wrote:
>=20
> ...
>=20
> > > +=C2=A0 static bool verify_constraint(enum states curr_state, enum
> > > events event,
> > > +				 enum states next_state)
> > > +=C2=A0 {
> > > +	bool res =3D true;
> > > +
> > > +	/* Validate guards as part of f */
> > > +	if (curr_state =3D=3D enqueued && event =3D=3D sched_switch_in)
> > > +		res =3D get_env(clk) < threshold;
> > > +	else if (curr_state =3D=3D dequeued && event =3D=3D
> > > sched_wakeup)
> > > +		reset_env(clk);
> > > +
> > > +	/* Validate invariants in i */
> > > +	if (next_state =3D=3D curr_state)
> > > +		return res;
> > > +	if (next_state =3D=3D enqueued && res)
> > > +		start_timer(clk, threshold);
> >=20
> > So, then the timer callback checks the invariant and possibly
> > reports failure?
>=20
> Ah, OK. The 'standard' ha_monitor_timer_callback just reports failure
> (react) in case the timer fires. Which makes sense as at that point
> the invariant is broken. Maybe add some wording to highlight this?

Yeah indeed. That isn't even the 'standard' one as it isn't explicitly
configurable, but yes, at the expiration the invariant is already false
(I currently don't support AND/OR conditions in there).

I should make all this process clear, especially that those state
constraints are the only ones arming a timer and leaving the state
after that expiration (if the callback didn't run) or going through the
expiration itself implies a failure.

Thanks for pointing it out!
Gabriele

