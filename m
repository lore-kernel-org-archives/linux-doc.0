Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792689554;
	b=zrr5wmZzZQWZdzj3npI9yp3DI42ps5KDSGe6iun2b28Qa5mb2ph79qlhD6+vRvmfhS/A
	 Wb6AqfB5RmnJDHjxcuFQ7wQk2XCb3gbXGyyGCi/7zjo7w2YoycrGNWjNMYWK5qU8mJ/AE
	 rEwuY3n2MHYHrm1pWRJJds1idBh3UloC2F1qVK8e8y7f6pxlITGMJ6L0+DeZbBhHBAl/y
	 eMt1hQ+XfFsu4EHJM2b+HifT3qlep5TChmCEsU7VKyvfQxXnHtXadUiUpcwd+k0ASGOsQ
	 icd0OtTjQ7D7EOPFfjgF8uc7V5arYg6785QWt+snCCYSrSzss9cyz774zNAwYUrwK3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BB37ifua8Sxb2GAG5iG+mcuA1PmZC21b7zD8v0nAGJ4=;
	b=oexC7JiZqpvTPRIPcitGkqe+yiBVtbTeEo3VK4e7wPPlqU8ibSdnyhta9gk9hll57Rxw
	 YkCG2U1c6sDbVjFV91N2jCZYV1LsM/5cxb8+LmZYqMlGbNENS/gnQldCyehKVg0FI/zlM
	 bJ5sIYCrHMME6EicdMTizGnzdtZ9pfYjfhChwtmSnJvTHXGAX6UJboIRKN7aXDZMZn7CN
	 pMaHWNIQ4VP4NBHXEdVVL+vSe6vRR3Uv4dFOiN3EZ2/qzaI8NZIC0eXNSZiUdi7oy0Hh2
	 fOwRNjrJmHFVwDJv30lNT5NZikDwS/OCOrgrvAzrWDVZBQR021u4g+boNvvuMyTqtCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b="K1eIq/GM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A91606A31A
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 17:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=K1eIq/GM
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd3310348d2so474649a12.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 10:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792689553; cv=none;
        d=google.com; s=arc-20260327;
        b=J5Zh5WSn7JH/dMmOFbiJkc7W/d8db5Ug2QiWi80m1Tj6NqwWmEKzbXTDLg8okyxpLo
         WHXe/EDUZMPek3JadsTgR+Hn8GGvyIjaZU4vMVW49YcIRHK0IlfDPj0fDgqEv7n6tnHN
         qG3Yb573BByDPMQ8mqJMbdf1JF+8hDZGHqbAuK4ZAUHIODleZURs84olU1yYlkR4wQbA
         QY3VsumSxAK7KsQtdg85nVtN5YdKm28F43Ca/2p61+Vf3v6/IAjmDnN1WizViAyaplQE
         do4LbKX4e/6KM6odzKoPqTbuJ1R2jkkvsfaauqrM4tpc5GY8gIa/ba2pSsZaPLNmfpAN
         L5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BB37ifua8Sxb2GAG5iG+mcuA1PmZC21b7zD8v0nAGJ4=;
        fh=q7VXbYSDOXKti75DUtMiDSqVh5Zy8wsuRiDLAxN5U5A=;
        b=ZXTts8mdib/kMkSzIlvl+SdspKVJnyzjewXGPV20I8Ij3quetXxV87/hQ8dFjvRENE
         DhbUVNSaZmjBdRmlX/2lbImJm11vs1WxEZ8p/0k+ouR3Oh/pE2HKDVCex5VTszGC+SQh
         k1EdB9y4Su/krGeAOvLfV9beT21iRj9TdH4cLi73cfhiEHBBqRft3BYjymQwPzhGGZu8
         OqF8xZqyk6Jk/7OdDSkPbrbp3vHn12hwKbilJwB13jmFwc9vMgVKVSUJDbd0/PMxikPV
         cSxeOPyYwgMGM2bTr2uLkTq0hYZ26ZgFRg+BkEdJvC3CZCbnGLnE/doB7MwuiLUYwjyA
         uVrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792689553; x=1793294353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BB37ifua8Sxb2GAG5iG+mcuA1PmZC21b7zD8v0nAGJ4=;
        b=K1eIq/GMjRwymTiDRmvQUK4W8vEF3J66M/qREU4Pf5Dgs5jQY47GYeuFACctzhxRMp
         JVIwSc1p02bUGb7HGwOYlEo5uZFib/eQJhSVsSgYR7CG9iocSGXDcq05KcghSCfYpgwy
         tSFcUsS2z/n7aHILMoQ1mkvzB+iyUr4GqW8+qaZVoW1HBBwoVccXepzOQGzfx8z+oMaH
         MbnLhZnhS7e1RtF7WDLLDAdCPSOMm7nw6oq6jiVMYt2JckrcBnH+P1DSoy230ddk83Y9
         MOjI5cf98eAf0w7/SJq4HQ1j/7yH97UuyWDx6nIWaLQ0m7oBxCg7jZCwsTT1NW/Pj+VT
         1VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689553; x=1793294353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BB37ifua8Sxb2GAG5iG+mcuA1PmZC21b7zD8v0nAGJ4=;
        b=OMU4M/No1gRq1mHK8T1DzefDGhcsTukFBlLOMlOx8FZ0SJyjkGE4HRe8i2RFadBIZH
         JQ7q3MOmENTPjXtf2FsLSy+UCjBR34jp2DPBs+PyuLfC8sAPBurwAhgFmboT85Cmm4Gz
         76NwdzNy3eqLvfT++npB8HOGaTqXSMciwGqA7uHOt4olnD7Z52+ALUFhRwPYhM+yW/qV
         3km4ktzkjTe2SHeAtCGhkENhXBxmVlGjj3lPYxeeX1FAEgkzQrbOTwTQnWXtcviVaK8q
         l1OUtNmpXu3jtyrz07lYpSmaNVDF0bY6m4u3D/4in9k9drMMiQwrNRQJPhwsWutGUoFe
         xJ6w==
X-Forwarded-Encrypted: i=1; AKwUvBzP/FAZIngwEL3WfJE08fDipKk9FtfLmxLCuBybynzW7e2UJ1IbVJtue56X5XsZGUspH7E0bE4YdOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwruzLXeorGSaMcWv+BPKsjmsf/NpiBkdaUMObpAgkTzDYvJfi
	Hy9zY9j4FqW7XFK8Hzl1Gwyg9lBR8Y356aKQtZzlnIFrNGRbuZP9wPbf1s7aE7WloGyPJ4crz5P
	DkZ7gszBXcMLyvMCtz3iwzN4/3Igxt0mp5lJnpdgP
X-Gm-Gg: AYBFou2oa/mAaob09MPf3PA0kUVhiC1r9ZppN19GNRQxbKWtpNOnGtAN848VlnU8/Y6
	9znyPObXBKZJ0PcKFPDz89x6CQvHXCvVsPdbj4niMab+fRIsXlg3b/y4G+1kAq0P8Dkaygq0xhk
	SFsZ1COtDAbAf6i+rEiMrQhMEhFmrcA5vlGsjIBqF2XnJ+erFhWFQUCIiwvesyfUjEOOgEFyZ0H
	MrijCGJRUWmPU68qOi48q8yUx8cgpZ3oKXyEQRoWaD6uenkL3YQNNAymWZJgsaln4cRxr8m0v3T
	MunfjJGS92339mZO4CCgszUomEX90EGX2p4iV2oxgtFoxnl3M7wcJr+P7/Z7ng9DUOYVluObigI
	BugYsFzHLVfkSwSWwKLd5Yq/E+baZd/PYWLLIrSiLx5nYZG/SJDO92rqvHJUY7jTem7/Y
X-Received: by 2002:a17:90b:514c:b0:3ac:95d7:2f95 with SMTP id
 98e67ed59e1d1-3ada6d24c14mr2208639a91.20.1792689553067; Thu, 22 Oct 2026
 10:19:13 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-ipe-keyring-rfc-v1-0-156f0b93e843@nvidia.com>
 <20261019-b4-ipe-keyring-rfc-v1-1-156f0b93e843@nvidia.com>
 <702ade20-a2f3-4919-97e6-c72faa89399a@kernel.org> <20261021-groll-donnerstag-erfuhren-ce34a0ed4e97@brauner>
 <CAHC9VhTHUU0h9k74CMT6wYhMwyY3YhbSSFwJoDTvoFRyTFVZwg@mail.gmail.com> <20261022-hausbank-dozent-hurtig-9443f3777475@brauner>
In-Reply-To: <20261022-hausbank-dozent-hurtig-9443f3777475@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Oct 2026 13:18:59 -0400
X-Gm-Features: AclHuK_mpvVbVbsjXsFY4C_2Z-Hg3ACXgqMxfwiNaJKHEvEnCJIfbBS66y6uEck
Message-ID: <CAHC9VhQ4sdCRvJ+YPZoiQzR_hgQN6-=84qvnTDDGPf=7=L9-jA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] ipe: add the .ipe policy keyring
To: Christian Brauner <brauner@kernel.org>
Cc: Fan Wu <wufan@kernel.org>, Manuel Huber <manuelh@nvidia.com>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Andrew Halaney <andrew@amutable.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:19=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Wed, Oct 21, 2026 at 12:51:35PM -0400, Paul Moore wrote:
>

...

> > As far as I'm concerned the decision of how IPE uses an IPE keyring is
> > up to Fan.
>
> This is really not an argument. Manuel posted an RFC that follows two
> existing in-tree keyrings to the letter. Fan asked to deviate from them.
> I explained what that costs.

I felt it was important to show some support for Fan, especially as
your comments came across (at least to me) as particularly harsh.  The
strong reactions in your latest comment only served to underscore my
concern.

> > Of course, fitting in with existing norms is important,
> > but if it causes IPE or existing IPE uses a lot of pain, that can a
> > good reason to diverge from those solutions.
>
> Which pain?

As I said before, (emphasis now added for claification) "... *if* it
causes IPE or existing IPE uses a lot of pain ...".  I intentionally
did not make a claim either way.  Once again, I wanted to provide Fan
some support in case there was an issue and he found himself in a
position where he had to push back to preserve IPE's model.

I think we can all agree that upstream kernel development can be
difficult at times, and not just because of the technical challenges.
Working in the security/ space also carries its own struggles beyond
that.  It has been my experience that having someone stand up and show
support can sometimes help make that a little bit easier.

> > These days everyone is
> > going to implement whatever they please, but if you have
> > needs/requirements about how you want things to behave in LSM land, I
> > think it would be helpful to engage with us before you make a decision
> > and then start pleading with the LSM folks to adopt your approach.
>
> I'm not pleading with anyone.

Perhaps that was not your intent, but that is how I read your "Please
don't start breaking an established pattern that works well." comment.
I believe that is a reasonable interpretation.

> And the engagement you're asking for happened. You just didn't engage:
>
> - You read Daniel's bpf keyring series yourself in August, Cc'd the
>   keyring folks "for obvious reasons", and had nothing to say about
>   the model. The cover letter spelled out in detail that systemd would
>   provision that keyring the same way as .dm-verity.
>
> - On 2026-10-11 Manuel announced in the KEY_SPEC thread that he'd
>   propose a .ipe keyring "modeled after the .dm-verity keyring" after
>   "initial discussions with Fan Wu". You and linux-security-module
>   were on Cc.

... and you are seeing the engagement now.

> As for "everyone is going to implement whatever they please"... In May
> you told the bpf folks that "we just need to be willing to accept that
> we have different needs and show a willingness to accept different
> solutions as a result" [1]. I don't see why that shouldn't apply to
> systemd using BPF LSM.

I'm unclear on your comments above.  Obviously out-of-kernel-tree BPF
LSM code is free to implement whatever it wants within the bounds of
the BPF constraints/APIs, that was the intent behind my "implement
whatever they please" comment.  I guess I could have made it more
clear, but it didn't occur to me that this would be a controversial
statement since it is already happening today ... ?

> Frankly, I couldn't care less whether IPE chooses to model the keyring
> the same way.

That wasn't clear from your earlier comments, especially considering
your tone, but it's good to have that understanding now.

> I'm confused why you have to speak for Fu and why you're so
> defensive about this.

As mentioned above, I wasn't speaking for Fan, I was speaking in
support of Fan ("... the decision of how IPE uses an IPE keyring is up
to Fan.").  Perhaps you didn't intend your comments to be received as
overly harsh, but in my opinion they had the hallmarks of anti-LSM
bullying that I've seen far too much of over the years and I wanted
Fan to know that at least he had my support to make whatever decision
he felt was necessary.

--=20
paul-moore.com
