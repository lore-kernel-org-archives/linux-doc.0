Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448444;
	b=23bdjjAdv2lXM36j2xfdkQsNJEZI5muOePTWyk6jZpuU4CbM1wA6OjL764twbpE9UQdh
	 PL+9kFlAd3MfpPIbJyew4+8sjM3KMnx+iCiAUzSkrauBGj4rabdyeuC0LJ4ft+h0Ndo8T
	 ijE8/giJSfPat6JO3iQl/FQLfYhpfT1KPzNogN62oNLRrYGFkR0Gh54qMmoe8ijJ3cOfs
	 PafLV4SAbSHL1tzK87uLcyhJ0eC2opk6CsmFlNXcTYa6qMiDM+OeROlIdD8/tckBnlH5L
	 7XU4gg0zQayc5zlUeeXWy/9t8ZSgfnkCZzsl22TFBEzkebrYn2nJK4cXWl8dUweZ4Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YxzVyVE4ai8Ea+LyIq1A/L2q3uxrmhBKTxjVeIPKjac=;
	b=j8oM63C47Y0mwUiqJhX9HZmIHJXCLZF5hVbNd3J068p/XxK8f2EfV1u3dh6QMKOGAKXh
	 nOvF7Zi/6BncTngWWLwXv7TyX96ZnB2TikPUzShDkLoBZesfpCGp8N6yx6NaUoZ66wRAP
	 YJK/cIv5osseEYrGeoFbTGFgBMb9Ei8Kn//042WLlmNq+7r+DO9s7LpxAuEc4La2y4qAG
	 SStUj6YQcqzRrk9qMt5iE6m0s+1BIdOghmdQ9CLIoy5GrFoLot00xgBxHbmBV5EEZwcg6
	 GlinIkx/VFSjPQZwgAJQvjPNLxncv5/NyJ3/iTWJt/ElnB3z3LQWJAuEf8BK/CfzuUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DCWIajyU;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473960A262B
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3473960A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DCWIajyU
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53644b28706so58824531cf.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795448443; x=1796053243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YxzVyVE4ai8Ea+LyIq1A/L2q3uxrmhBKTxjVeIPKjac=;
        b=DCWIajyUd2NrR5Rg5QH4BYrc18jOuaIFNK9krdfrMVuNBFHlfubE8POzOdp0A6zoio
         BK3Jm8Da6025c7dLknh9DJk0+VZH9DV55cQrJ8yJnUw7oCdRMpIHTUv6YgHpYHhqIori
         GGrUVou8pcQMhd9KQWvZXddio3gurupEp+aji/SeMFzVVqTC+CtP/te/WmUVmR+NlGSs
         KmBOlJCgCk0+qX6nR0Aw5RMZqvS6VBJFSdaldgcPjsZr2AoWVUN5puz1Vgd90tEBLzpY
         eAIRonSuZWxNolGYAuXxViEQpSYv2RNGlQkdAhBcBAeO1UcT99mpa3vZgxg4rC/bbjsA
         7Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448443; x=1796053243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxzVyVE4ai8Ea+LyIq1A/L2q3uxrmhBKTxjVeIPKjac=;
        b=oj8ikr0LvH2ddpCgLNAiYdCWjOXUsic8oRZE8xwaW6lUy9Nvr9ovQBk0sHQgc64umY
         gOJroMNNP7vACAoN7N7+N1IM4xiZ1qzlEFGCgzCqaf+q2ktcoYVCJKdvROF5cJMoRawO
         sn42bYX+SOKzd2rMU43Hu3+65QYOJO1ZIESr9Ywd5oGhA8VmUxquWRrlbCmWN7tgzZKd
         vuvnJC2wGgCJ8CMiu1BxrcLs0EeZgzHaFux33ZKmOdVzHe1uhArWvyTnoLxavgcLrDt9
         CCjMjaB2pTPQHYCak+t+YHgzdgrVnr0JWXXB0g25XXxvmKH747rIEyxq9piOWBwHiqzE
         RFRQ==
X-Forwarded-Encrypted: i=1; AL+hErFCsLvWOl6/29HNdU+kCqke/M80Lh069rCO8MBZzthrN53tMyWIhd2QPG/0ltW2m1ZEwJB44xRH0rk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a9Et92U+p9deppWrJ7skD2QWEoinSBYHipcSBlbCMGdEo8oOf
	HrMyOT0zeCsdUaaOKrn6IwMRSOlgdV/dGxTz2pZYdSXdWRd3jyVCjIWV1DNwV53fEik=
X-Gm-Gg: AZFdTZf/sJGdJ+27yFGZFigBszU9NjyxnkTSEYGWZEK7U/SY2rSAkKo6TLAAcO9Lrw7
	UL7h8oWsTpxG5zucuqaWvtkf/PUgNemNmDW+YrUZh3f2nFccrPaaz9EcyReuKAu6eQYdaF1oC46
	wcjXf9frm0AbUVRDYmAA0Tsv19AYDqY6eeLDlydahw2DSqy1UQeJjG/VPZlyIWrST8qhzmb6huU
	XUp6fH7Rlwc9qaHf4kO/PaaGcFRx+RIAl9n8ZyBA+cWTmAU8RuLWD1FHv+4tRo4VU2TW76AcqW+
	g4OC6NIlsPSx09HVJuD0ubp18zFOlWVTEdvj/j83oczgpBVhYONxsxezczQXza0mb1wzRnSPaH6
	HFCzAbPeHvlHYKO3OnwCShYniY7vKTvUeT9VSJp+HzVJZNBJaLApdvSdICYY+HVHY7RIb4G0KZL
	lLrpxuqbs7PR4q0bgBCLw3YVoTY+ENaJtH811t1I3G8peoCDRlw+4SnKADZcmEAbiCle5Ibb4sY
	fSiv2Ag11Ouo+8D0jZHfpbyjEJNUORYsQA5rZCSNccpPo5fixNikoMxcyx2LdwghgEAQ1RyXYD+
	Z5s5ugBM9PkTUIcF9e07U2YE8LmIHmCyR8fg6z+l4tAAZx4n6EUhIHZrqFRtAR2+jwyVrjOKYAV
	TaMs=
X-Received: by 2002:ac8:570d:0:b0:55c:bc0:63cc with SMTP id d75a77b69052e-55d768a2916mr224280231cf.6.1795448443241;
        Mon, 23 Nov 2026 07:40:43 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134796329sm107324056d6.2.2026.11.23.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:42 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVW9q-00000000t9u-0g9S;
	Mon, 23 Nov 2026 11:40:42 -0400
Date: Mon, 23 Nov 2026 11:40:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@resnulli.us>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com,
	zohar@linux.ibm.com, aneesh.kumar@kernel.org, dave.jiang@intel.com,
	nik.borisov@suse.com, sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 9/9] attestation: Add the TDX family implementation
Message-ID: <20261123154042.GI179082@ziepe.ca>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-10-jiri@resnulli.us>
 <awQCrnD5CtEhKRWz@e129823.arm.com>
 <awQz1P6iXYrL8lv0@kernel.org>
 <20261123151128.GD179082@ziepe.ca>
 <awRYr7yB8IWj7S3G@kernel.org>
 <awRan8ZELzpTwduV@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awRan8ZELzpTwduV@kernel.org>

On Mon, Nov 23, 2026 at 05:24:15PM +0200, Jarkko Sakkinen wrote:
> > > > As per the function, perhaps tpm2_calc_event_log_size() should be
> > > > relocated to lib and have non-TPM name like firmware_event_log_size()
> > > > or something.
> > > 
> > > Probably under drivers/attestation since that is where all the TCG
> > > formatted logs should end up. It should be 'tcg_event_log_size()' or
> > > something. Maybe a tiny module for it like we would have done in lib/
> > 
> > +1 for the name, as it is obviously more accurate prefix.
> 
> Location, I don't know. I was thinking something like "lib/tcg.c" with
> routines that are plain calculations based on TCG/TPM data.

I think we should not have new users outside attestation subsystem,
but the legacy onces will still exist obviously..

IDK either, but this is my guess..

> And perhaps for tpm_buf (both stack/heap allocatable), if Trenchboot
> ever moves forward.

DRTM users will route through attestation subsystem to do their
extends so the tpm_buf user would be the TPM driver inside
attestation. We definitely need this for ROT agility.

We should be able to build the attestation TPM driver without any
trenchboot stuff to motivate it.

Jason
