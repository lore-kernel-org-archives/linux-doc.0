Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400AC37EFFE
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773442552; cv=pass; b=KYbjiswogh5MeRFz+N+2BFDhfA13OKwvdNZCJ1DTQxd0Gn7Zqw4f5NTbkQ2naD2JK55Zxqc04JwU2ESZaIWzycm30pBTKQFa02KTLtU/Wd/GOHTkqHEijNOclXi5RzEWNgLX3X1195Mo2sO8QGR88qxyNzZik8k4mvsoOEUSvAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773442552; c=relaxed/simple;
	bh=1Ty0xY5cZA829vovRzYzuYeyQoqsHZ6EMyQIZz33Oxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUxaMbCuAjGB3RZIzWdLyEymTsUnhp4nZ0ewiUtXggGU6Vnv3vaIYzB3dAA+i//+C3YvOXvTFbNUY3E8SYVDhxoTG3v4H9Gpgyv/u2nCcYSRsV80Migf1mtNc+cwnSgNBPQnBg508HVxvoquryjFcxCtdlbTOpC/ZK8cZeicqWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=LvQ7+Aoj; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="LvQ7+Aoj"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e4989dacdso3130542e87.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 15:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773442549; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0Lrh/SweJ/yp5Gq0gVv8xQOQc2M6r+2b7BHZSuKS/bbTMMmy/jkukKhnGMeRZWCov
         1IvxtyZMWdrAZjJaRpuSL+UjOuoGIwJulBT+3QQkmsmzsyMnSSz2V6vmoexR49ZXHjZj
         Hkm2sK/WXh/iByqWYcfApZYuyDnIsRSStHj1mwWfy37H2ONjJChyfuJg+NTgxYxP6cfA
         CDFbMIXXvigNoF7rglB2MZDVkJmllw1KjLWi/UqHvANlkRHRyYW/uJhFG5OGb+ud8z7X
         thuRGHZowLKSAMKb4fNa31iyUswTge1stX2Ct8k2g/RNd/TfkXovfcZu2C5W1H5kKiRO
         eEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3QNx1W8EImhWG5G2h7xr/vJQj2kmarfg6d7Z6ksV9w=;
        fh=Di/2S1M6fOHY/Vcm61DnOQ51ZOBqS3EU63jblJOh/yc=;
        b=DMfKacDqqmayLXbNOOMn7eeRj2Kp1Um0NH63ybESPcNEvDPz1vR6qJbCZEeD6L3UcL
         Eb1Pmd9yEJ6gst6QVEuls7BpDzyBXbAYYQXTm54etCtvsyZHbByrJx5Y5UGcAF8usuPW
         cbv9Y190GUnHn6mmv3doaNFwp2d3UqKBWIdxpT4tl6ccv04mvlZOzV+blZW3Y04R32/q
         R71C5EL8bbN1NhXX/AFZueLuGGWdU56fJSc4FhNnmzRWjIvEIkpW2x768GMIJkIjW0yD
         SD1JDpmI+t0rApm83lrJlpkBZBZlyjuojfhdU9CcTXI/gnMfkVCXXhPYgzPb9dcVNQXw
         zUzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1773442549; x=1774047349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3QNx1W8EImhWG5G2h7xr/vJQj2kmarfg6d7Z6ksV9w=;
        b=LvQ7+AojIQWbWslVxV6LZp++FCtfugv49r69G25dyddJVQ9fPkxdSjNimICXT1G3RT
         yteZJtN4o43lx5JI9ETEBiPHRQUuYuVt+Y2bqPbCdA6ZSX8ic2t62emO7/JsN1LrfnP0
         GKHCPYWxD5DiwyI7H4bda8dma8dX3n+0KRrUQs5iNgQEFZSSBb8gtD2DWkdT15jp8bC0
         VufTk410tXmf+a+ZS9Z3onFFt4HURkznVec9CNUXuj9a2omod4iiPXOFMka6sbFzUrCg
         xsia3X3JlB+QfnmIuBi4pwgW5SlGehvapj4envNOBrZpXA+IOgsPpVRGRzEilcV1HeZB
         SYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773442549; x=1774047349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W3QNx1W8EImhWG5G2h7xr/vJQj2kmarfg6d7Z6ksV9w=;
        b=B+Q3/o5KkjPzmLrXRrBxBsLVVejYj6uNzZjcT0NbP3maz6wfwpLbifqS0hsTSYq2nY
         +xJMMdc8llvu70iJH2/8R2ekgsjqKxi2F5OQKpbeYlxebEIChD0IYvjum/6+K5e/gEes
         9E9nHD9qMzQbZHwSrhbXFGt2oPg8rQyWmbAvH4uGeJcaxnmw/OUesdcHvYJF65+xQNg5
         ZJIaCihMPEmp96TvZY9oYP5DFJdN7BWiSUf1xRogt4D2U0V437R+juHE3piwcCxlMWrv
         1YaPtAh9+UU3K3dWQQvN9VFDvmpW0rAwItfknI0aqeOuUzeP68pQMYW6ihRVojCexRrC
         EiIg==
X-Forwarded-Encrypted: i=1; AJvYcCVQcc6LyZzSLmx/zsJFEFV2YjM+0UoS8wHZu0m65sNT28kJIAeCWQsg9AFi9MNYoUYlY3XVhJ+4l28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQIsyjGuuaGBi7iq1oRf75A2kfSudaLQ349H2J3Bpv7eZPt6+K
	ZzNOwTCUWPf90M2Z0bH9xZaXoezbLThD4uOc5SUOArgsDWlHw+cz1rfmcjcgrh3pj+bIvOvxs8+
	yx4Eqc0PmF/k9giFHRWnk2QvO7mk1HcezVwaxSf2A
X-Gm-Gg: ATEYQzxGBNI8s3TLw8S1R3n1pBKSsbnRWQ5QFpuWecN33LQMak4t0Pc64ivVB/Ei+0Q
	ZGlSgM4uXoCa4GLblzSI9C0PnFX74/r+7WIEv/QPCtCraYTO/+iCD+hHobfDb1IXH99s4d/i7bc
	KJeie21qsVxkcq9w/YSASWaU85feVQpXvTyWidjCmx8Pt5itUsVkwpBXfUI2pyp/nffOKLIMOtn
	HEGAbntpywKjrwDD3k7a7TG2+8hNJ3axIDBFr/RJt9yJTV3KK52BPQbdjz2dDkuoTDeJ/+rWVUi
	FdyolIOtbAI96hciS4O8O/JrXhX4+OylQBh4DdcQ/Q==
X-Received: by 2002:ac2:41c4:0:b0:5a1:227e:2753 with SMTP id
 2adb3069b0e04-5a162705a51mr1219058e87.7.1773442549289; Fri, 13 Mar 2026
 15:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312223157.25083-1-panchamukhi@arista.com>
 <abNxz9T_XB-JtBCj@strlen.de> <abPVr5RtRmZeyszb@chamomile>
In-Reply-To: <abPVr5RtRmZeyszb@chamomile>
From: Prasanna Panchamukhi <panchamukhi@arista.com>
Date: Fri, 13 Mar 2026 15:55:38 -0700
X-Gm-Features: AaiRm53c8uPZmtPIEF5jDrLrZEH8Dcp_VPBm6r1Z8iuHGq0Ct2Kh-ySBjwFklDE
Message-ID: <CACqWiXBYJgM3S+QfON-fJQ=dPX3r21CVMN9rAXcxM+hi=DzydA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] netfilter: conntrack: expose
 gc_scan_interval_max via sysctl
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Phil Sutter <phil@nwl.cc>, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coreteam@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 2:15=E2=80=AFAM Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
>
> On Fri, Mar 13, 2026 at 03:09:19AM +0100, Florian Westphal wrote:
> > Prasanna S Panchamukhi <panchamukhi@arista.com> wrote:
> > > The conntrack garbage collection worker uses an adaptive algorithm th=
at
> > > adjusts the scan interval based on the average timeout of tracked
> > > entries.  The upper bound of this interval is hardcoded as
> > > GC_SCAN_INTERVAL_MAX (60 seconds).
> >
> > I already said that I'm not keen on this approach.
> > Its a 'we can't do any better' type "solution".
> >
> > If anything I'd be more inclined to make a change that allows to
> > more easily override the next_run computation via bpf.
>
> It is regrettable that the request for this knob appears to be
> intended to enable a potentially proprietary hardware offload
> extension, implemented through a userspace daemon and a proprietary
> SDK.
>
> It's 2026, there is plenty of infrastructure to offload the connection
> tracking upstream, such as act_ct.c and the flowtable.

Thank you Pablo, for the suggestion. We will look into adopting the
hardware offload feature soon.

Thanks,
Prasanna
