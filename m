Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA6A4E50D5
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608159; cv=pass; b=k8e3tReYhO+BCuQ5ucm3HfLFArBOvfEYeBUv2Y6VlUO/m4uWmFCkg6ZOax4+hFlq+GaVRO/i0rgye0fP7qagAgISGakZxOslwVRgn0k0qL21PQvj8dm4Df00XfXOk4ha4NhiUb7Wu5u/9B4WVv+0ZTOpX9ifoyyGzw86LcRaHZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608159; c=relaxed/simple;
	bh=tf/lMLnfEkd4XBBYB0HDsWtgBfU2mvcJMYwKWgwYVE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8oCdoCAatwAj8D3LjiUG/8C4gWszizqNIaM+1uBdAVq7TTNwXINivLwmgmDzyZV+2FFBx5RjaLFdhvEtVyA+GFzAMCe6D89pUsVpqxomoU3hcZzgdmf6ygJL1afW+ckKPY7TpVnl8cesouhcnJZZI4XjQsbO2PtjsYnFVOE3NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wp3Bmv8O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZS44mltT; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wp3Bmv8O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZS44mltT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790608156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JzwIQlJou2cKoXFRlxragLvVGFjjNACZv+ODl0Exo0=;
	b=Wp3Bmv8OUEgxLreV5rmvvCgm6SJw4sthMqkxFHUqejJV+mZm9uQDvubi91SFmyLi4ANZ7e
	pTLK2GhtAd/IuecaRFUBQlycjAD/WHEA+F8VzBo1DOQ+f6h15paKstQ0P76vCdNniQS33L
	n1/E0R0nG80gg7TAuRUFMqs80a1JawM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-bKyJaZi0MtiJy8pR8pdhkw-1; Mon, 28 Sep 2026 11:09:13 -0400
X-MC-Unique: bKyJaZi0MtiJy8pR8pdhkw-1
X-Mimecast-MFC-AGG-ID: bKyJaZi0MtiJy8pR8pdhkw_1790608152
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4870af30a85so2481844f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 08:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608152; cv=none;
        d=google.com; s=arc-20260327;
        b=iBIFxCyC2wf12nhu0t6ZJwfVnFpQYn2oWTRV0RmbjEpamb29jgStKmEKDUdgi7R7QP
         bNtcxi2mMQO5ceU0DO4iTSBcdbcC0ygFQMhcQEDCzWo+n2Es3WoYGtbL5zs5ao8JPN/j
         MNdVuWknQ5abdcYaNp9F74DIFWgXtW/14p99nXFKm1duwz0DyHmkNE3q8MYZFHpt88ig
         lsw6AGUqSc00EYivBnHWZjCNAdmTzVyw7NEoqWNv0OmeeUzNlB/MK4HxHqhYF6g1Jqf1
         V1PgQSRC8UQvZGwFc4zi7qgODjjiSUMQlvOZcvYHTD6993aG9zaPGJ5dRylO3hASn4nk
         nqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7JzwIQlJou2cKoXFRlxragLvVGFjjNACZv+ODl0Exo0=;
        fh=/eusSEUECVFacZmPQ7e81eksegYHzvVlmVPxDfg7aYI=;
        b=TGr8NraAVlc1KMa+MBStvGJxGPuaUEu16+8fhR3tLJTojaCTLsS+4TVVdpUEBCrdEY
         T4jOwDTuoqf0DxXt4/gJmLZ9NVPa2nNnzfZfIrcPWR7rub8HtYq4OowPIBEvm67R8PKt
         dWHKjxvF8VJRIeAtSv4tpqIpPVudq6eICdmC6bIfM+o6m34m2v6W5Tiq1v3MEXToXTyq
         0jUokydvwlvZ5pDrWx9zwI4SHQjZZ+DCaFVddTNnWeP+JoPfJ+sWVIsO2rKMVeOgAI4C
         Z+HFwIFwUANEFXwfr1yFU7YdozwBNs6j3DbzSy03njTPudK3/9bNBlT9DKqbsm+owQ8n
         2Vmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790608152; x=1791212952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7JzwIQlJou2cKoXFRlxragLvVGFjjNACZv+ODl0Exo0=;
        b=ZS44mltTmMf0SyNxMZyeKj2hlI1jstoJYS3HkeryJ83V+5l7tCNohVRT/AQt3rpA9C
         sIQCirdNUtuQLy6nN7+uGDH9K14nxGz3UJe08tUBpuGEreNiLnjxf79QrS9jB12LttT+
         ZbL/BL2pP3g8GLWRr3NBm7SztBKA+77LG8fHLIMQWEqxDZsKdjSccbXQFBMxTtTXtYIQ
         cgMGptMREIzj2YovrtJbRrSfIcznsk5IF2uf1R5+z/I2tX3qhNyd/2wEvO1+vVaHjX7a
         6OQMGtUV6yWsS490D+EhkKYUmv0kF0czjUAk8ZJLxW+sfeBV0Z91zDMTtQtdlXheijhd
         o8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608152; x=1791212952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JzwIQlJou2cKoXFRlxragLvVGFjjNACZv+ODl0Exo0=;
        b=AW18JN/t1ZotINSigZnTRe902QjvOuDRk2RCdLD7160KQYgHmpttuwJNSPDM6UlSW/
         dGbIvlvmOi513b8GE2lTlxIcpEZVssTn9CJET50IopQcc+XnoqiKDsOa7vqIa7QuiOXY
         KLHlbpEvWhPLah8XnIpCRUUaKRDjTSfcKX+/pdu5YSu/Ox/QdKqTTYt3/BuGlAfRyNZk
         kf9/B7x9p6+lkyRbPpBEiH9qxzxPE7HOR7zjL2fMbSBRUP7iztmWi9f8PmU4od+DhHxs
         cxz/BfeOcmlRjyTek6abq9mi5ZPffqSDZJ94YtfzNiVNd0m0UbUInUNR68DY35fiLmlc
         CUfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT+EeQGfHD/vK3dwvrPufFgUEXLAcOunI3gt4+WnqtTX5nMefcoY2/jx3boklwmyQHD7zpIrnBZVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc/i1EzvWmTM6pNt1nPJ1YB+nNg5dmpDXhDnxA5ZdjlN7MoOcs
	WPjVMkg23kElB4P/mEdhKFk6Rst74I/V7+9bXsT1uxCPxnUiWg1xkJRQBdE53IcO3aYHvyteAK7
	VXrMMFOwkcvta+R9MC2wi9rwMRm7ynwt4ljWfl2KmFFsefXkJ15wKQdfvatQdGSvEEosPNzeKov
	KJp4EtFdWb1Ihs+cpzarH3BzsLWoyAilWdp00C
X-Gm-Gg: AYBFou2aB8AWhEvZfvZtL/qHJXoKOLwi6wRfmGz4HASCZ0bw0EdsA17Li/KxtT6dVqY
	NaRYCN3AhL75hNSd3cYqu6SMiYbE9+WCHrMUVUIhTjwtAPd4kYyZk95jWVJU5KOOtKXPiGLi8Rj
	gb9pLP48tDk8gEDh4jtZzEe3V7OK35I2IECVMGzByUzo901Q3vjQogbj1Bm4GJpcGGrFlHwQxw/
	X6qoB0zYP47+cxlxA==
X-Received: by 2002:a05:6000:2083:b0:487:342:eb28 with SMTP id ffacd0b85a97d-488716f2354mr27611175f8f.24.1790608151765;
        Mon, 28 Sep 2026 08:09:11 -0700 (PDT)
X-Received: by 2002:a05:6000:2083:b0:487:342:eb28 with SMTP id
 ffacd0b85a97d-488716f2354mr27611104f8f.24.1790608151341; Mon, 28 Sep 2026
 08:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902200547.184734-1-jtaubepe@redhat.com> <20260902200547.184734-8-jtaubepe@redhat.com>
 <ab97f32b-31dd-4975-a8b2-b445110ae3a9@suse.de> <CADRr4bePoiDnWX_XrMWtQe=1g4Yrw1_dK86EV2k9XZR0HnL+UQ@mail.gmail.com>
 <d4879e78-2735-4f86-beab-8aa319e9162c@suse.de> <CADRr4bcSvLwzfSiV0LTxnhZR7oo3F1b2XEo+wwqi668Gr2BBQA@mail.gmail.com>
 <a7a60b61-24b4-429b-8ccb-ee5b6f06a5ed@suse.de>
In-Reply-To: <a7a60b61-24b4-429b-8ccb-ee5b6f06a5ed@suse.de>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Mon, 28 Sep 2026 11:08:59 -0400
X-Gm-Features: AclHuK8rEa0dRLnGnsUacjiVX3fDsEVHWVQeb9zJZDMDBAnfAXNWF2dGmvnsVw0
Message-ID: <CADRr4bfJtQOKYFjDoR+khaPvQW6-UzN70pZ-nfGJnQ22nUkskw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] nvme: fcloop: Add set_marginal_rport to sysfs
To: Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Justin Tee <justin.tee@broadcom.com>, 
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, Paul Ely <paul.ely@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali <njavali@marvell.com>, 
	GR-QLogic-Storage-Upstream@marvell.com, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, John Meneghini <jmeneghi@redhat.com>, 
	Bryan Gurney <bgurney@redhat.com>, Chris Leech <cleech@redhat.com>, 
	"Ewan D . Milne" <emilne@redhat.com>, shinichiro.kawasaki@wdc.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 1:10=E2=80=AFAM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 9/23/26 6:16 PM, Jesse Taube wrote:
> > On Wed, Sep 23, 2026 at 11:34=E2=80=AFAM Hannes Reinecke <hare@suse.de>=
 wrote:
> >>
> >> On 9/23/26 4:56 PM, Jesse Taube wrote:
> >>> On Mon, Sep 21, 2026 at 10:03=E2=80=AFAM Hannes Reinecke <hare@suse.d=
e> wrote:
> >>>>
> [ .. ]
> >>>>> @@ -1671,6 +1719,7 @@ static DEVICE_ATTR(del_remote_port, 0200, NUL=
L, fcloop_delete_remote_port);
> >>>>>     static DEVICE_ATTR(add_target_port, 0200, NULL, fcloop_create_t=
arget_port);
> >>>>>     static DEVICE_ATTR(del_target_port, 0200, NULL, fcloop_delete_t=
arget_port);
> >>>>>     static DEVICE_ATTR(set_cmd_drop, 0200, NULL, fcloop_set_cmd_dro=
p);
> >>>>> +static DEVICE_ATTR(set_marginal_rport, 0200, NULL, fcloop_set_marg=
inal_rport);
> >>>>>
> >>>>>     static struct attribute *fcloop_dev_attrs[] =3D {
> >>>>>         &dev_attr_add_local_port.attr,
> >>>>> @@ -1680,6 +1729,7 @@ static struct attribute *fcloop_dev_attrs[] =
=3D {
> >>>>>         &dev_attr_add_target_port.attr,
> >>>>>         &dev_attr_del_target_port.attr,
> >>>>>         &dev_attr_set_cmd_drop.attr,
> >>>>> +     &dev_attr_set_marginal_rport.attr,
> >>>>>         NULL
> >>>>>     };
> >>>>>
> >>>> Please don't make it a fabrics option.
> >>>
> >>> What do you mean by fabrics option? How should I fix this?
> >>>
> >> Your patch does two things; one is to modify the parser in
> >> fcloop_parse_options, and the other is to implement a new
> >> sysfs rport attribute 'set_marginal_rport()'.
> >> My suggestion is to drop the first part;
> >
> > You want to drop the parser?
> >
> Yes. 'set_marginal_rport()' sets a boolean value.
> You don't really need a parser for that.

Yes, but we need the parser to get the WWPN and WWNN.

Thanks,
Jesse Taube
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
>

