Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147A556B92
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 13:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710249138; cv=none; b=MjAVO3jTWmVh+k3Ca0DCXKeIgJ6dn2yZO139im9sSxBl4mJRMP/F1H9g/CcDLGiOoAQwOi1dO3Jg4tCPS0Oqid1F736P4rpp/2Z5DHrOS5mSP+D9xPO6sDD1nGOuhBi5XIlTfvbs0Sj797wr1+fN86wt4qaiCLu0qWyIk4M/gDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710249138; c=relaxed/simple;
	bh=5rt+RWbBJPhAUl1uqDwh5UWlve/OPz4PeCvfGqj3MHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/zlkqerQTb7Qpi6qkoKzvhwiFb2z0A4/v8a2Bev2Qa1oQl/xsJ7jYW4k6R1K5ytQFe+AIIbk80CcNSrpSqHHlQu/r6gsK+SAErWltzVmCv+Znid2etSCIljmdnPBYn8QASeq3iKwb4DtU5gVFoHNHrPj+KoCgRQPTv2bDPwy/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=AeF5oxQS; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="AeF5oxQS"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-609eb87a847so42020437b3.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 06:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1710249136; x=1710853936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGm6l1YRLh5BPGXSeJhTa5Xkczn4uT6yuT0rED+ytkk=;
        b=AeF5oxQSugPKh8jPGo1deH2heQlPo67Gx8uPfkXw+A6XRCMxKrmhop4RTi2Raye9w5
         td3/8L7cAv6COx2n55EwL5JReK1i4P5PPiYypoSIGkwLVHIPPS/nIssVhO6EvVoiSdwa
         25PWyN9KMeoyTR/gJFW6FP+77dd1uhGAFDEy7I0P298m/ZrujwVNmzfBJ57RnEVJRnz7
         hFIHzsvn0BzaDpDVS99DEsWFQFKYhVbuQt8C8bZjIr3opLAh5ipZEgkQMXlkanYGp1ue
         yhcJEtkhHMAz7ALFS6U3xG0xIZj2H6Bi1chBbMLE5wbZkq+AccKzNCXCc5KD/mfWZoRg
         cqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710249136; x=1710853936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGm6l1YRLh5BPGXSeJhTa5Xkczn4uT6yuT0rED+ytkk=;
        b=SMmxnMRFdSoaHkIcjeLQDL60dBU2Dr6i+59ZD+H1KGea+yAAbW7fLMpovxODlAofBv
         m/7w73AphdcLnixJHwSq0zQl0HYshtNvlKS9nKrY/klCpuegtNNb4UwyBdoWzlprC2Lc
         9ZjYPOBCUCPqOSoo0sjZuTqSwN1Bgdi8Nc33KmW9MM/6ncKlkcCDcWdAW+wYLr5Ln9np
         hG5ZeHui3XBU4y6Hr6+8ahXfxss41G42A7G52z6lvzUHEkBmzbSUUh7WzxyCiFdcisCW
         jzL1hA8X7I4K2jAdAnWaBS2zJliaJ2LlXN/M0oziVUgiDwXbLGKab5h2N5YoVBV1M/wK
         +/LA==
X-Forwarded-Encrypted: i=1; AJvYcCXNx8u0oljBgLnX5oktQBNb/DkJ2NxgR4Xk8e6mtX6JlDDsUFSfuPXfYZMEZzc2ZKuXfgaazjJ4xRSQLYnGZaLV3Ah0oY+E3+xE
X-Gm-Message-State: AOJu0Yxm4ZFYOyE94U40pRDh7+zOXOWgP3RXvOUwyPoBg/xjwBQOXEax
	39K3pq1sMkJ5aH1RIv38/J+YZDmLy7iYEnJC2w9u1Z0R0AP4wPgs/G5trVWWeYgfqVb/OA6fziO
	HjUrErhgKH2JxO82uZGOf7az5SIZqp+97mTBD
X-Google-Smtp-Source: AGHT+IEdiOBkJ+adeSqv+rNybEPwNkGGa7iFCLcf94f4++BXPp1TK3JUSZqCbU2Yvqne0MvrzB+F7Mt8oGlgCeTEfL8=
X-Received: by 2002:a05:6902:2841:b0:dcd:b806:7446 with SMTP id
 ee1-20020a056902284100b00dcdb8067446mr6722695ybb.1.1710249136161; Tue, 12 Mar
 2024 06:12:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1709768084-22539-1-git-send-email-wufan@linux.microsoft.com>
 <1709768084-22539-16-git-send-email-wufan@linux.microsoft.com>
 <20240312025712.GE1182@sol.localdomain> <20240312030712.GF1182@sol.localdomain>
In-Reply-To: <20240312030712.GF1182@sol.localdomain>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 12 Mar 2024 09:12:05 -0400
Message-ID: <CAHC9VhSSWNa1qwZrWtj-ERFjN9QKR7fz17yb9903P_a2k6ewaQ@mail.gmail.com>
Subject: Re: [RFC PATCH v14 15/19] fsverity: consume builtin signature via LSM hook
To: Eric Biggers <ebiggers@kernel.org>
Cc: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, 
	jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, axboe@kernel.dk, 
	agk@redhat.com, snitzer@kernel.org, eparis@redhat.com, 
	linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-block@vger.kernel.org, dm-devel@lists.linux.dev, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 11:07=E2=80=AFPM Eric Biggers <ebiggers@kernel.org>=
 wrote:
> On Mon, Mar 11, 2024 at 07:57:12PM -0700, Eric Biggers wrote:
> >
> > As I've said before, this commit message needs some work.  It currently=
 doesn't
> > say anything about what the patch actually does.
> >
> > BTW, please make sure you're Cc'ing the fsverity mailing list
> > (fsverity@lists.linux.dev), not fscrypt (linux-fscrypt@vger.kernel.org)=
.
>
> Also, I thought this patch was using a new LSM hook, but I now see that y=
ou're
> actually abusing the existing security_inode_setsecurity() LSM hook.  Cur=
rently
> that hook is called when an xattr is set.  I don't see any precedent for
> overloading it for other purposes.

I'm not really bothered by this, and if it proves to be a problem in
the future we can swap it for a new hook; we don't include the LSM
in-kernel API in any stable API guarantees.

> This seems problematic, as it means that a
> request to set an xattr with the name you chose ("fsverity.builtin-sig") =
will be
> interpreted by LSMs as the fsverity builtin signature.  A dedicated LSM h=
ook may
> be necessary to avoid issues with overloading the existing xattr hook lik=
e this.

Would you be more comfortable if the name was in an IPE related space,
for example something like "ipe.fsverity-sig"?

--=20
paul-moore.com
