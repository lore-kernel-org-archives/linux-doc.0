Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427547;
	b=O/aI+DV0UQfwcn/2K+4rFrq7wu2iXClwHa7EdIXmRaOjw4QkWtVIApR2s+BfXZBKlFTC
	 FOfxcbQZ6kdsCWoLWibOhNGYbhoIe5QLwrsG2a8dLi80p8W0bS/xNKp1w14brCjZinE1w
	 9mX9Jq3BBo8hZAZIAUdudLNBpv82TcHvuXqILbC1SnhwVnog8VC7se93YEhc8OYH+4a1x
	 G1We1qwnTiJh+WiaGNEItxUe4q54CUC4lhbXhYNM32lZ6CYM+jhtAeEMHRonLPFAATV3d
	 N/TRbpFIMGMsPYxaZUJ4F8HRHh93P7IUSWln1JfpfyxvI6i5QsB2OcKMIJ6MUGtOXRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427547;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=Le4PJ1qJhxmaIRhwFNQeQkknTjXk1GEFa9C29hi3dNs=;
	b=aRXmQ8CsFvbKVfXQoS0+h9njXhVazO3uoADts51HpTFMzZtqQjU1jtx8FHjx/uyZNMlV
	 d9CehxcZDE6W+wbedPlObQWzMlb/R54bK2w6/D2qoBNhm/G1IZjQjkfc9BGnQXyXYC7dK
	 rFKxfeTL/Jm5IsC0yZRFC0w4Gvdjq9rq8YUkRKqTS5gvTSrRBH8TMY32PTNkw9jH+POJz
	 GeaxVOzbGuc+XRpFVai2V+bVD+bn9eQmvA7XUSUDwzJb4cLW3QtIzL/aSiu0ZGJkGeke9
	 Vx+h7/ep4RR/65Aql6TzPD4rDpvUmXfiwzT9iwFa/X2njyaTUgYcHd4XcNT2auFI8xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpnT6bVv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Jaj19A40;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7274A606A31B
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 16:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7274A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpnT6bVv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Jaj19A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792427546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Le4PJ1qJhxmaIRhwFNQeQkknTjXk1GEFa9C29hi3dNs=;
	b=bpnT6bVvqF+jUQnlTlzIUz349+gQbVPV3q19Wg0XLF62CafKwXURpxCpU4t+ok07Eswf13
	OoykFwjB2pK1nliTx2idhrMIFPNuCgczZVY+gv2RRW/6TRaMOmoz0lyWavawcPffEWA+LQ
	NDRQydgZBXIV893h495u7AAHwJU7nfo=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-vQS777esNYepbi78l_rxGw-1; Mon, 19 Oct 2026 16:32:25 +0000
X-MC-Unique: vQS777esNYepbi78l_rxGw-1
X-Mimecast-MFC-AGG-ID: vQS777esNYepbi78l_rxGw_1792427544
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e944179148so2941994e0c.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792427544; x=1793032344; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Le4PJ1qJhxmaIRhwFNQeQkknTjXk1GEFa9C29hi3dNs=;
        b=Jaj19A40NcopUc++brDNJ+pO3bte8j2rHirqQmv7K+N2ELjmRH3EG1lOPMumZA4LQC
         sKvmZ6orlM2582o/6bgCC0tzbStY0nlaiW3oCTU9dTzbmrmNPlGH2naaYeXAuwAimEbw
         5zVnk0UoUNwymZ5bfNFpqnoT1ezhgtlqTaIOt9JX485L500pKkSpjQfSD7wMF7uPrUfQ
         Mj+wSCew4v3m9cPL3TRogqakxIWIneHUmYOPhKIXu8keho4kKC9O2AEcLLu8TyJKP+CL
         bOMjf+ocNNWmrCBqhAtJGlfzIQwNH1neXfmX8CqAUGLoxmxIrqONN8dTuIRdlP1HLwxV
         pUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427544; x=1793032344;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Le4PJ1qJhxmaIRhwFNQeQkknTjXk1GEFa9C29hi3dNs=;
        b=fKKmIOddFiYTdvC5exTG6Bo6//l9OaYIB1X4ryXBjr6g6H+uwkjMhGShiLAloEMDfD
         qguCNAXriPjW2SkOrxtzfwR2FiDDKmUCJtNxmV+JmXh69VIXgqMzVP/R6qnbkKCPirhd
         u7oHbbGHI/iGak49vEsUfeBUOb+ULa+IuAL6sJdBGhDo8Tue+QKzt7mwSiAIh3SCfBU5
         qX8qB+IyH2Umh4ZjJT3ZrEX80O9Cu10gEZsjExI8DmLQUdYBO6Sh5DUBhKFIDY4MtxTV
         1mHmL+lVk2UfCmGUxO9KrzAf8gWK+YSmx4DVPrZSavOlOfM3D6sswVWZaJxvz0VJqiE4
         6yEA==
X-Forwarded-Encrypted: i=1; AKwUvBwBqjG44gDrFmbTg2Dqn5T02h/BqqCjB50kTe1IeoYdSf+BVLa0SsJgHHwCq4MWwXFsVnJZ8hYmw4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9J1XMgTEcweVwPUDYOXmcoOe5VuESsJWvklZdP8RVbWN1c/Vm
	6j6y5TO5DxEHVEBKHoB11EuWmXOsM21yKPlnrpc9hIPbDOeRwehp9969BP1PXu6KqiiED2OjHMt
	G+qq+mcb3KexKo5U+YzHwLbhgdspXbbUNU8lgcOTp0XYCTv419if65fYW0k3dEw==
X-Gm-Gg: AYBFou1G4RoglAgTwoHwAwXu8O1nzKlFrQNqYIvTXZWviCm2OQZ55mm/tE+fc6XSI88
	WYi/mRCxp2+yPHtWNboEuk8x2myoTPJ5+nansc6mSVfUvTpDym+XNtCyzqXDrnxRlOCQM91JGlv
	IH/F/WLMZA7qD4kSki6Gb/6Afq+diwYGLL2zhGn6Noth/g5ok+lQ1bhSBs3eDHSOZFDkMcJREie
	dLCjQmCK2UI2O5e6fh9/XcCuJ7igqKBIY9drOlpOpS34PqyN5VWHbo9q3fuC6pwR2G68F5yrSXu
	Fy2YDedn+hpiwPwNt+V9RzhvtastdvE4a02TY0odUinIWwt3doN8BRzSidn3Giq5eG55XUs=
X-Received: by 2002:a05:6122:1d07:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5eabe1b1e5amr1473609e0c.13.1792427544294;
        Mon, 19 Oct 2026 09:32:24 -0700 (PDT)
X-Received: by 2002:a05:6122:1d07:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5eabe1b1e5amr1473594e0c.13.1792427543871;
        Mon, 19 Oct 2026 09:32:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eaa42c2ab3sm9170267e0c.9.2026.10.19.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:32:23 -0700 (PDT)
Message-ID: <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: lyude@redhat.com
To: Theodore Tso <tytso@mit.edu>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
 corbet@lwn.net, 	skhan@linuxfoundation.org, rdunlap@infradead.org,
 federico.vaga@vaga.pv.it, 	apw@canonical.com, joe@perches.com,
 workflows@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>,  Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,  Jori
 Koolstra <jkoolstra@xs4all.nl>, Brian Foster <bfoster@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,  David Disseldorp	 <ddiss@suse.de>,
 Mark Brown <broonie@kernel.org>, Jani Nikula	 <jani.nikula@intel.com>, Jens
 Axboe <axboe@kernel.dk>, "David Hildenbrand (Arm)" <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)"	
 <brauner@kernel.org>
Date: Mon, 19 Oct 2026 12:32:21 -0400
In-Reply-To: <as7uqZn9rQ52USwy@mit.edu>
References: <20261009083137.3-1-sashal@kernel.org>
	 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
	 <asz9AeFe3CutP73z@gremlin>
	 <20261013123132.GC4214@killaraus.ideasonboard.com>
	 <as4pAEnLd4H68W4W@gremlin>
	 <20261013131243.GM56180@killaraus.ideasonboard.com>
	 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-13 at 23:23 -0400, Theodore Tso wrote:
>=20
> Using AI-assited priotization may have some collateral damange
> because
> it might not get the prioritization correct.=C2=A0 But ultimately, if we
> get a flood of patches from newcomers, the choices is either to (a)
> load-shed, or (b) burn out.=C2=A0 And of the two, (a) is the better of tw=
o
> bad choices.

Why is there so much talk around trying to automate portions of the
review process with non-deterministic tooling (don't get me wrong,
things like Sashiko help) and not "we really kind of have a problem not
having enough maintainers"?

The latter has been the case for years, I've seen plenty of subsystems
that barely have the bandwidth to actually review work and this was
very much an issue well before the LLM bubble. Is it not even possible
for us to maybe first consider trying to solve this problem and push
subsystems towards actually making it a priority to find more
maintainers? Subsystems like DRM have had this problem solved for ages,
I consistently see us reviewing work far more consistently then other
areas of the kernel I've seen - even with the onslaught of LLM
contributions. Considering how attractive a lot of GPU drivers are for
LLM contributors, I think that's saying something!

