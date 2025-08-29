Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013D23BF9B
	for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 19:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756494760; cv=none; b=fRBx/9U48/We3v7CzkEydJq4FNwTmhOggmooE2uY+PLVpm2R7m80n79wFmIWm+CRB71pIxrJADTB1KJY0yKgl0DLKRrlbv4hq4HENukI/M/qAIXSDzPZcJbs8PdTc9wLJhlaQfgJKtVXnroz6PpuYidS4udcmd6LyPLIHdv3H/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756494760; c=relaxed/simple;
	bh=V/m3x91BNGxXQk/xVbw01DnJgrBeVY3UssBVksdPu1s=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=McZERQjFac/hYZN8Rp/FrYD4juLK25CUHvAPV2BiTdxvm3V2jFaPkJDacDoW6AXbbrEngPHzUjFGaEy3PsguEWriZwi2D6wdxu+rwJw6618qrF8tvDQ+Xa6AgwaGUjx/pOyCCwDIyLj0viBg4r7mqDOITdFumFqTNe2dlmWesuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YiuigYgI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YiuigYgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756494757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZm2cWpIstR902xrNzB24xS3rX1N5ZEznfpie+G8xH8=;
	b=YiuigYgIuzLkKbdsq8sIpIj9neapVbNPp/b0hWSdne32KcrevJ8KEyHqeoCBr2HrBky+8n
	faZDxGfgtj1Cabfl4nEO8YLtUiaWS0AqMfTEAM27544YwWV8RGKn5CvIGedzeeRElS0aPL
	stbekEqS7r7KGq1wZNkXF6fWYGZ0iZo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-QEFVdTewPHyK8X7n_-bi_g-1; Fri, 29 Aug 2025 15:12:30 -0400
X-MC-Unique: QEFVdTewPHyK8X7n_-bi_g-1
X-Mimecast-MFC-AGG-ID: QEFVdTewPHyK8X7n_-bi_g_1756494750
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3eb14eebe86so49876485ab.3
        for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 12:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756494750; x=1757099550;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BZm2cWpIstR902xrNzB24xS3rX1N5ZEznfpie+G8xH8=;
        b=kf4bQCuI12hzFrweKaPspIHJudcFEfOi/pKPWQUJ07trymDohOd7B3dUQtrjt9YPVd
         UnMNWgzDXwdvZoNfwAVxuVA0NERBaqgHtwrqNwaJMMV8y3jS4JiLD/vu2n184OGpz9gd
         zk76oSK7vlZrXUTyHBplEkyYeDrUzKEi9BcnExxfGzMzVPI85BrgF+ibayLzNeTT25bJ
         jcLq2t+TPKrP91A6NVcytI/4LVpRZTakDsKk7cdgNPqs7bE5NvjGU/bGbZiVqCbh3Fjo
         EA+7nrQKu0dIQv5ZMcPC+/EVxcR2sOmePDHGnvysaPNhdhgs/eM8ulWXFjUfM15+sWYA
         NKfw==
X-Forwarded-Encrypted: i=1; AJvYcCUv/CqCm01exOREC0r6p8UUdmELHpiC4mG9hSRIl3sRMEts237XQQtcFJwDqhxrZFTTr0fP49sCwlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ9XmhorBplyY1FwG5wV6OdWz8Cj6NkTxTzDtLR1Y/SP0BwzCE
	fFTrh3GfoBFuQEHqYssXWNPTdNvSidFl0KqQwRGdXwwzmrlJ6wT6tdET3nYCT6QZyRFb3Q/tviM
	NNcuoQYvOhh9aCSlQTy+/5Q4H+laICrL4m0rl1BIdd+4/TZnin1OlLrlUjb1GBQ==
X-Gm-Gg: ASbGncu3cmPnjByivFoEGXsOcef9HmyHMqVUTZ6QdBQEqebSY69+/nF5syob6Hkhs8p
	XnJvFYwE68+jKM8Sx8gqdRRl54j1f0cNWOl/qjRrFSz4uBVPuTZkCc8TCuTuIYo7D/qLiqD0Hl2
	pzQFNqk5L+w5vF/LYW/cDqusRpOqbfRqUvVFoD2FLCF+71TBaarRqef3DgCdrPKo7MkHNjNIkDe
	narMGzQ/uznKtjz2j8T+jyngKMgbsQXiSVVKel4rn8Ut3YMU0bsROGOxte1KIvcd4s/A9P15iaQ
	5B4jUscmB5g3ij4JtkuldDvZxKuUK/HTgHIuvNhngeFxgX5hHL73vzIOc2kk3YEQVptj
X-Received: by 2002:a05:6e02:1845:b0:3f2:102b:bb3f with SMTP id e9e14a558f8ab-3f2102bbe6emr94593505ab.16.1756494749730;
        Fri, 29 Aug 2025 12:12:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp17PYTjscfY9oa2sbWXEFfqHk/8rOHgt2sJktj1EO4noupiV57kW7xO47q2rgyKkjnPt3LA==
X-Received: by 2002:a05:6e02:1845:b0:3f2:102b:bb3f with SMTP id e9e14a558f8ab-3f2102bbe6emr94592895ab.16.1756494749273;
        Fri, 29 Aug 2025 12:12:29 -0700 (PDT)
Received: from crwood-thinkpadp16vgen1.minnmso.csb ([50.145.183.242])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f3e6c3asm38211173.84.2025.08.29.12.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 12:12:28 -0700 (PDT)
Message-ID: <3b9bf6e435b2eb85b44557d474a003ec6d2c0c1c.camel@redhat.com>
Subject: Re: [PATCH v2 2/3] rtla: fix -C/--cgroup interface
From: Crystal Wood <crwood@redhat.com>
To: Ivan Pravdin <ipravdin.official@gmail.com>, rostedt@goodmis.org, 
	corbet@lwn.net, tglozar@redhat.com, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 29 Aug 2025 14:12:28 -0500
In-Reply-To: <9394c039d5c957bd8417669148391e20fa1276ee.1755018581.git.ipravdin.official@gmail.com>
References: <cover.1755018581.git.ipravdin.official@gmail.com>
	 <9394c039d5c957bd8417669148391e20fa1276ee.1755018581.git.ipravdin.official@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-08-12 at 13:21 -0400, Ivan Pravdin wrote:
> Currently, user can only specify cgroup to the tracer's thread the
> following ways:
>=20
>     `-C[cgroup]`
>     `-C[=3Dcgroup]`
>     `--cgroup[=3Dcgroup]`
>=20
> If user tries to specify cgroup as `-C [cgroup]` or `--cgroup [cgroup]`,
> the parser silently fails and rtla's cgroup is used for the tracer
> threads.
>=20
> To make interface more user-friendly, allow user to specify cgroup in
> the aforementioned way, i.e. `-C [cgroup]` and `--cgroup [cgroup]`
>=20
> Change documentation to reflect this user interface change.

I know these are the semantics that --trace implements, but they're
rather atypical... especially -C=3Dgroup.


> @@ -559,12 +559,17 @@ static struct osnoise_params
>  			break;
>  		case 'C':
>  			params->cgroup =3D 1;
> -			if (!optarg) {
> -				/* will inherit this cgroup */
> +			if (optarg) {
> +				if (optarg[0] =3D=3D '=3D') {
> +					/* skip the =3D */
> +					params->cgroup_name =3D &optarg[1];
> +				} else {
> +					params->cgroup_name =3D optarg;
> +				}
> +			} else if (optind < argc && argv[optind][0] !=3D '-') {
> +				params->cgroup_name =3D argv[optind];
> +			} else {
>  				params->cgroup_name =3D NULL;
> -			} else if (*optarg =3D=3D '=3D') {
> -				/* skip the =3D */
> -				params->cgroup_name =3D ++optarg;

If we're going to be consistently using these semantics, we should move
this logic into a utility function rather than open-coding it
everywhere.

Also, theoretically, shouldn't we be advancing optind for the case where
that's consumed?  Not that it matters much if we don't have positional
arguments once the options begin, and if we did, then allowing
"--arg optional-thing" would be ambiguous...

-Crystal

