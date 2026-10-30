Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360950;
	b=xnR72g5h34Ns2Bn++THFhFh3WNKVuzNKk7NZmIbfdhqPHiwY+FD+D3yuEJLCz/9ND4hH
	 JMqNRpmYylcb2gckqzLcYWTiP6zJaH1GnV18iRAmzqJg6lUS4e14J1tBkKEkvZ7LW345J
	 5aSk2Ck+h5F99pLT0DMrFWWP7G19cqaM0Gbw9C5+GJRr/tgo4chRnXSU6CZga1gqzPb38
	 zib0TLbOKbxt7qf+PtHSUQ1xkhfdkMzvdrE622CG/WG//5RCeox7FRyGxqh93wOu7JXiR
	 q14nDRNYzv1EthxPS6EjAAWq9fjrRXk4+XGPzVrUXvhyUwfZa4Y62AUuW9vAPPAclFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=cN/kTdZeplcVxA05yfEtV/oWHM65qTlYYKDtomQxBWo=;
	b=f971M234ykLY3lOvRbIaflF4BQJbTa7+Fb45c7wJk2pPP1OaY8kcRskPVN5QLz3LBmPs
	 RsYV6isKaTbBXZA8HUTd9cgpY31yYfhk2/UTK5rDbulMR08THDvfQO/mY+omxkeU+Eny7
	 A7TTxEOsoLDc/+lKh/LDJ2bJ93MgxzuYT2hbsoHDXtHrrfScyQv2ksdvZWuCYoknAUzG4
	 kIj2rKQoIrCiUNRtcuRhMmP+z8lTP58EyuTSnswEyajr9sDHdro/emo7ug5U8Q0zVCtkg
	 oZXaaqqxKF8N/DqG+E5jWwZuOetqA9XduzrG2kyLMV2W+nCJ2SDbCTGQS0knAb9YUbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBx+faCc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093D606A31E
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 11:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8093D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBx+faCc
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91bb5795792so7768846d6.2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 04:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360949; cv=none;
        d=google.com; s=arc-20260327;
        b=SS8RoyYdiqNPeXVlMY63SDDNCUrLzz/jlVHSRY1k1bvszSCP9KUSpHUbiFclvP1XZ+
         6GDDAawMzGNZQP4/trdqpiOHjTE0WAsXbD26i/m8SZxVMxfnlrTAxCx3l6mzor+vgrs4
         DWxxH7vwt3sCOBSrq0/sT5OgDbKFv2O5QbXjk+LSe9i/akJjJxUw3x8Hxk06rJFizTSy
         8Ppz65ypcUHd7j6qva87amtoi9BrlmbE/DN6CcXa7YNg4Yvsh3lklgn/15mwrs6mwB5b
         1D1qsgAICD6wGFs4ANJvGsL9XoO9sCMNWn4hpeML1tBqNjxhB4u3Hln8YknEqQ0CpAyZ
         d5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cN/kTdZeplcVxA05yfEtV/oWHM65qTlYYKDtomQxBWo=;
        fh=R4dFORs7+ie4jEX8oDdIFsjHLgfiFlH5dlo+YQGv/9M=;
        b=rH4o7dMiBxGLibL1WxPJe7zBjktuwQZG8vbz+exi2KiwVWHG8gnptYeY8+XxAviK5Z
         dZQxouqFKLYbmCYiEPvqABrWi7Z6Zozgc6FplbQCu8HOlKtfjV+h5SC221Dp2qq7bUY3
         qPRXnjjslE9UPsMMcUNqhyYSY90ve1fTTACKLloyU24riNELX2sbCceRlZeqCtkVkQqD
         aFgmOEWlG066uQ1xGlKmFEu1IN0zgMWovpRYoFjZeJk4cq37ayRs0B75pM0BVQyddDhW
         8yLY5aylxAoV43qlLBV+Ud2S/3IIDShN6aGNGTxQp6DOza4fniIoUyf+aVf/o04/u1LJ
         SIEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360949; x=1793965749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cN/kTdZeplcVxA05yfEtV/oWHM65qTlYYKDtomQxBWo=;
        b=FBx+faCc8UdbEPnXz2CionMZefSq8McWMXQvMV7Z+S+AAasXQo+14XwEbBhg4QJpQg
         ptOUWt+JRV8JNla0xN0S7pV4gp8UBckzhuc8739qYmq2+dDaBsyx6wmbJP8Www75WLdX
         bQlhOl5u3nN4Qwy/1voJulPXduiQSY+ZSxov7H7ebdK2+H62NzHrO7I98X1QUTxkSR7O
         fA/qsKkScK8cH1lkKX3hIodPzjs6VEi/R+uV97U5/xzXNS920pcw85lBsMOOKvTtKt2E
         a/rKdd2rbkyrPrVdmZRQS9oZRHyRUtqODnnrHMkDJM51CHM7uuJ7KjOHuMPWFQose4y3
         tZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360949; x=1793965749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cN/kTdZeplcVxA05yfEtV/oWHM65qTlYYKDtomQxBWo=;
        b=RXdTe6bpf6mN9sd5I5wk2pxP1flyoCIUtH5dDtwqAvXw9DZTMCF/byG2u2eRrs/g7v
         RBKptgVw8pqO50/bpHt7ogPymkXtQ07iK7Uqy1QpoaWkd5dbERCv0b0T5U9OlffAT13l
         LHBw+h1Oc4KgTGaEwgeZTY2IH5akza2EjzciVtxuyYZxeVPXC3iDv4HH61hS8snZv4Et
         jrg7sDNYr/ffIrDTVth9zjWJ6H85HiAHTa1F4THe76ZZwXEW6HSpdP7proWqvOJ/sRvm
         G3k+LLj+dYh0O8vuZYnijrTk4O8zgagk/faJcWcYvrOrnfDLcnCLtz/7nDsT6fztM/eV
         vimA==
X-Gm-Message-State: AFq9FYJmqkxSBIJeAg7XmwJmMYj9uykrvbbNM7x1go3omJ+x0bZ8Ksxn
	uRQszRjqZpXnkoW5aLuS69LrX7qKmoVXjC/zu1DPxQB9+IiJfrWIwAJNPWnK/GzWanQhhr5yCYn
	nmqlCunH26zzh/tSJg0W0h5e12bJ9H8w=
X-Gm-Gg: AYBFou0FQx9d5gVUBroTMLcHozUV2q2Z3Gbkzdjwz9AaeTRDhB4+qurdY25WUrNx1Ml
	Ovu5t2mD07DVDqm7ribmkFzC9a2i3jFtIJznbtul51PbWAXU8oAkDunQc4ehV0u8h2JiWfIw7nO
	eo8wMSpw2p9iyVr8E7KkB4GBkgP9zS4aYn2L6WLlrucY/6qppg8NPZohuQ6YQXe5QM0yJE0YJYR
	GzKazXXEv+3EwhvQSyXimN9H66a0sWZbVbDX2EZaJhdCzPGQmZz7z5p+0qkZucXMtvOXwYGZo1z
	kRK77H346G87ZRI4B8pl1a/nff5Y0BxZU7OCyxcfW5DCJcoWC1UaRfKXLjPu8Qde80o1Q3hKINI
	axTslDFAn6HEiIZDD79heJVUJySVSWVWf10Nu5puwRvLszCiD2LpoolxPVtxM37yoSWyJGn5BG/
	Nq2LGa0ztwd7DWlUQEqG4CPtONplFJDVQ+wKFHb8YOwKdpSf1T6Sm6ixt1c0zglXgEvtYlP3/BQ
	sW2hpVpwO58ehLAFFMQrrvZ
X-Received: by 2002:a05:6214:230e:b0:91c:7f16:dd81 with SMTP id
 6a1803df08f44-91ca4b1ab28mr25702266d6.22.1793360949101; Fri, 30 Oct 2026
 04:49:09 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029222951.19065-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261029222951.19065-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Fri, 30 Oct 2026 08:48:57 -0300
X-Gm-Features: AclHuK8QWpHxlNT5Zke5Es-oVsU72PV8OOx-IR9iKRxSGgSHEZHP0bVpaNgsQVE
Message-ID: <CAMAsx6fmcnH6sQgMpnqbzcpc7_Jq6pDPDWAiRfTH0Hobn6d0_w@mail.gmail.com>
Subject: Re: [PATCH v3] docs: translations: pt_BR: add maintainer PGP guide
To: ic.gabrielribeiro@gmail.com
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 07:30 PM, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> wrote:
>
> Translate the maintainer PGP guide into Brazilian Portuguese and
> add it to the pt_BR process index.
>
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v3:
> - Preserve source certainty, tone, scope, and emphasis in reviewed passag=
es.
> - Restore the =E2=80=9Call downloads=E2=80=9D qualifier and remove the un=
supported software detail.
> - Clarify Nitrokey eligibility and Git tag-signature wording.

Hi Gabriel,

Looks good to me. One note please always keep the changes from the
previous versions in the changelog, or add links to them on lore.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
