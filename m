Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DE3332EB2
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 22:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767912617; cv=pass; b=fhoi6qThQIy0SgDM3mfNTilQuwqHrK9fU14jdnTVmq7/u7jb2n8HZH04Xl5mqzX6ioq+qRrtxXNaWCaTo0VlkiUPyAbDgDYZhR5m2/zGqp30ldyi1Oue3ZjyHOrU8YhUYkVpT7MIWcvdnGq0EYfpH0m1ooZ9p3Pxrlj8tXpVM6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767912617; c=relaxed/simple;
	bh=0Kg9b2/WsUIMEqmGuRHA5a4yLHhV5XKlV8sTuaMp9aM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYe3CyONpoBf95HXbUKTMzf2/5xUIOtKdZ+DQth7WXwpvisXqxTJNCOCWqLtwT7nM3RZ55CbfeSJ0/xQOHfqhZ172r410yFngesAZ/RyTbXNxz3yV6n0pULDB1mxIUv3UWkB7t90L0iRxvtZur8EyQGJTQ+2oeLF/GH2cvk7Rfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EazdywGP; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EazdywGP"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4edb8d6e98aso182161cf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 14:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767912613; cv=none;
        d=google.com; s=arc-20240605;
        b=OB41dWxdEIv/QYedcFbLexKCsBNQ9Zp1WwcbNCy6ex5JdZ22TpEIcegaSsZrtX1KEb
         IDsuslnrK3o3GUPBB1hgJ3kLVZlHRCDFisnPKCvniB3M6MP7Q5KFyTjrnfaf2a0SEAM9
         ztc1njcDA9rj6jT967ohXJXh0I+RFt+7lFwY7Xqg8E5451LxenTyoc0avba3OrWaqT7c
         1vnUlHqMvjiDSHtMZ1ptmGOZQEpfGkA0B5+1OsdLhfHihE0NEhV97pT5j9Z5hwulqfCW
         tmwH9TD3xvxAJu5Qz23lAPObVlRR/LkSZ1C8OC2B3XufMip5QQ656Prx0BDb4NxNGO7c
         1xvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wseu+RuUn8NgZwFWIiGhlQzFjB8QZcJo0bXjL+h71eo=;
        fh=nzT4befK9pHBu0oiRLCxNvODHMgrtb2O65Z486Ze6TQ=;
        b=YMYzf4L+z3/sFNTJOPZPdV9o1ZtaowhayjbX9CUvEXODPcUdd5GlN3RFYt/r0L5S/3
         vv/HOgHMW0UhcDo6k1uauVoB47RpYdkFvHt6g06HCIxwUuuVNOiBSNE96PJRmaUPJQs7
         Bl9A7JE7YPI3BtEnuXHsWkFkhZ0Mes2mbKUFaaPzgbh3GXC9DXkK8lWF9QH8og5km31r
         JuQ5a2lHqS3D6sm2re+OgJ18rhbVMUgneHOPR51h6V0TIoPxSfB/UltlzF3ixcF86Ul8
         l46LW+jAwpt9iZl9+ns5gyWnYCVA1aWz/MISt9YjORZoAeeUGLsVEEpN9XME4ZYUvC8M
         vi3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767912613; x=1768517413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wseu+RuUn8NgZwFWIiGhlQzFjB8QZcJo0bXjL+h71eo=;
        b=EazdywGPZDCXH3Fx5TCKx8lRPKR1YFKi2rVdJxp5TFEc9FPXgCHy4+KFLFNwGHIJJs
         MgHNdzGU30XBZ1gHL6jcB8RAcVWXfiGdoYbJDPT/CqaP2NI/yiTrIV1SNx0tyaZO4YXV
         zvkYL3UjcM9Z9Qf10f2eJdWOWTVNoySi2LyTw7UCfjNZxlGwaKLj4LgUzShVswoDMInM
         iDMUOmfSYe5ThtQoc6lXI5oOjrmKRbLm67kAwNWAZMg1esDPV1Al+Q0DnAb5EOEt7B1Z
         n2z9uIEFnyRVShloZtvQXCgoTvhZt3foz20FPgvtnC4XkJyMcEA6USyg1aQv2WE8QqnS
         bLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767912613; x=1768517413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wseu+RuUn8NgZwFWIiGhlQzFjB8QZcJo0bXjL+h71eo=;
        b=XKeuDzOcJYhtb+366ZILSHKwyvAjTDLOinA037omipH5Ua1pfOeF9q5zoUqe1bdFL1
         eWOVRrXG06It2jsjQWeWQNwyn+kmf3CsAx579iqeoyWe/n7ffMSTQyjUP3kik8g/ucxm
         APuubqqWNUtftmGu6FSbpXCpJuGnbalbhcKDrmOoEstJno3CwT6BbsqBHdjHPLqQzh7v
         cyEzzHy95pHPDwwYHZNePT11ZkaOnCUjNsE7Pon8aUFG0JlmHjbgrQM721AkOaZW7MDu
         OMljR7B4GCInWYUpxxFeyxmC/1dfIAmB60BFeeZLSYAp7E5NZw29ydYoAFUGsd87gc7Y
         kp3A==
X-Forwarded-Encrypted: i=1; AJvYcCUIAkjeRhdwGNyzTELXEI9jMqKT6WoS1OAoAfjvf6pnihefDpOB4G50w16B6cXXa3kr5ikcjRtEnU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJTdZ9uamXbIx8+6P+6mSqlleTDdlByhK917xt4kGA6GNeYEHf
	jiN09+fj8MFgI7qR5BLu1AxRuMDud3oJWe1mV6VwVMYzmunER12Wq/KKCjMBj0kSMhFwj7jXoGH
	Zv/xLfyZBnQ/6KLDMlC8BETXsGm/hCljzj7fexrTl
X-Gm-Gg: AY/fxX45zV1TVxukHKXS/1EAhfusLkSccqMVmY7MxVmuWMgiUbmO/vSuCh4rpGoUyuN
	nhr8gnfTmbvTmVdGRIYqn+3KRKX7qxsX1BaztG9gz/+QwN3fd4mtuhNH9I7WLc1fi+CsW9ZIrx2
	19cdZf8yHOYFO0BTdyZSVmpAmtVGw6gP02M9LKCAONXoEEQdv33V3Xlsld8ElVlUShqZGLQpyW3
	XoZCRCJNd1CYhSSMTwSWpjkiyx9o3dHWTjFxEieTqcd12N/pVt79sycumHA5dhWwrCUYo7bZ7ju
	93drJH0DYFMXx5wpRXaGtBWEQ8Id9O5S2yVYXNFjlY3a2gqymnGlVo9/PQQ=
X-Received: by 2002:ac8:725a:0:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-4ffcbd0a84emr528911cf.3.1767912612694; Thu, 08 Jan 2026
 14:50:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108155816.36001-1-chia-yu.chang@nokia-bell-labs.com>
 <20260108155816.36001-2-chia-yu.chang@nokia-bell-labs.com>
 <CADVnQykTJWJf7kjxWrdYMYaeamo20JDbd_SijTejLj1ES37j7Q@mail.gmail.com> <CADVnQykyiM=qDoa_7zFhrZ4Q_D8FPN0_FhUn+k16cLHM9WBOCw@mail.gmail.com>
In-Reply-To: <CADVnQykyiM=qDoa_7zFhrZ4Q_D8FPN0_FhUn+k16cLHM9WBOCw@mail.gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 8 Jan 2026 17:49:55 -0500
X-Gm-Features: AQt7F2o6WroRcnLZsfsh5rQuai7Ltrdaj81MBXbeb_Nn4Vs-CAUHJkiKVn3RRPk
Message-ID: <CADVnQymHK0y_ALJ6obg60j+oUgjgpA8daaazin9hzO+-O6oRdA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/1] selftests/net: Add packetdrill packetdrill cases
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, edumazet@google.com, parav@nvidia.com, 
	linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org, 
	dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 5:47=E2=80=AFPM Neal Cardwell <ncardwell@google.com>=
 wrote:
>
> On Thu, Jan 8, 2026 at 5:46=E2=80=AFPM Neal Cardwell <ncardwell@google.co=
m> wrote:
> >
> > On Thu, Jan 8, 2026 at 10:58=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.=
com> wrote:
> > >
> > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > >
> > > Linux Accurate ECN test sets using ACE counters and AccECN options to
> > > cover several scenarios: Connection teardown, different ACK condition=
s,
> > > counter wrapping, SACK space grabbing, fallback schemes, negotiation
> > > retransmission/reorder/loss, AccECN option drop/loss, different
> > > handshake reflectors, data with marking, and different sysctl values.
> > >
> > > Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > > Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > > Co-developed-by: Neal Cardwell <ncardwell@google.com>
> > > Signed-off-by: Neal Cardwell <ncardwell@google.com>
> > > ---

[apologies for the premature send due to accidental shift-of-focus...]

A third note:

(3) the patch title seems to have a typo; it is currently:
  selftests/net: Add packetdrill packetdrill cases

I would suggest something like:
  selftests/net: packetdrill: add TCP Accurate ECN cases

Thanks!
neal
