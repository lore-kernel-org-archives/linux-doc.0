Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597779;
	b=Os4KUmjTR6+MkYFOapBAzNWJK1PmQl5iiF31gifFiwYnsch8ArFQNvW4n+MKpG83ECoi
	 rICiNhW4HPQ6f5Xv8p7Ga3nDoEckf2bVc+FWFELoh+IAc954ua6uHRJGVMBCBGnftfpM3
	 bv9LdP/pI87aP9vVOYgRPdtAfDlw2j+K83l7Ex14ZnX3h3XLIJp7L3aaZlWprMbExK+UZ
	 f14BbLfK8h6oyJvrBKjZR5fk1Pb59zaTJ6Kbe8qZyuQKJjN9sL2JrAt6Fru6HI9yM+XJK
	 lLvi2iMifnGSyDmcmK2c+VsAQ2JctfwIucthwn8llEnZKPW7HNvhrdTIsPRAJ4hlBHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qm/FI2mE1ewe632JTFSK32XwvOS0GNyWzPRE758QoDs=;
	b=QdpDA4o44/ogZ3Y4BCp9BHCT555jJCocQyNlHFxvyv5zWezBtoxCKVJjMsAVVoodGTNS
	 jiw9vXhvrJvUk7guj6GfVYnOyL2eXlPLqPKzmh4cWa8tn4jXzt+ielIi4iwXJZUV2yNid
	 SF9eE0tKbkytPMCqqOEWtERXabSSA6OJ55vHP/or5LURkkfpwfyYJkePmuIyniDIcA00p
	 LUDNdisB3fCxSslfErIX/ryEnPkP3gr+MiahmutgMZHNGfcjfHKX3Mx9qH31h/hNoGFRN
	 BOSISuxkg+PZ6KbJWx6V8lFwv0Srgwu2Jq+WBMwlvSRUjKL0ifN5oTasRd2ob3bfhUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGuiiqVQ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABA7606A32D
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 09:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ABA7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGuiiqVQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so50252895e9.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 01:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795597776; x=1796202576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qm/FI2mE1ewe632JTFSK32XwvOS0GNyWzPRE758QoDs=;
        b=AGuiiqVQqunjoBCYAQf0+aaIX9u8Idwr4BsqXiFG1Y2GXVcd2nGAwNB2bzu0OZsqvt
         JBQWV39Rzw0Nejmv3JjqTkzRxtSB81AvLEnWqd3BIlVhavaIMQto0Hj4ItwMuVJN5t9m
         qDDTsY+zGckYze/eL0Fh35Cvy9GGXbsePdi8hxB00PegW5V2xSwtYpgnQ+XID8ik3L5c
         ETRwW6xnMEEQ916w2d83q83ZxbDdUag/69/1p5CzvXoFbS+9l6yLn8rKodkjDPPM+Rpi
         9t2xYHAx0GtrAFVGzYv5GsoMxIqDShH+sPkkV4Fh0S/+l/GBUcpTn7YbFICB2vlEmz20
         X+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597776; x=1796202576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qm/FI2mE1ewe632JTFSK32XwvOS0GNyWzPRE758QoDs=;
        b=pExrrcFAdw2/GuDza7ldq2Sr1n+17DSAvF3Gb2Zps+12HQHWnCFRkvzaz5B/pQDMmH
         iLfpgrxDFn4ZorGGnu3fK0d6JGGouinC1QsCVC0QPl4dmRX87psawvx4qYcUDjkKviZ1
         vbIvBa8pAY6+ZGEQImULEj9cwMKq1/v7zCh/yWU4mo9CFId793l5qH2nmtDcEKdjeJsh
         XEVecvtj26/PMZOhLZ41dooXCjA5AppD6W3w6KRmbAKT22diCXtlsh/F7EcCtvbm9h+2
         +EBjXO+MdmV8NXuD1WctQ+Bewn1jBQTKj4betMYmgZPNlwTBAj9cSh6TAqrKHuXTQC4b
         VW9g==
X-Forwarded-Encrypted: i=1; AL+hErHyWArwzXOAelIo4ULpBBZaNOqLxUukfM9F04shxMDy7004osl4drLV5BmSL6TenETAQ4MISshLcjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jzC1td+62VSLss7nchEej1qgRDZCqD8lpPlnuzjtPHg3Fs5oW
	kHQeKjNLdKPxTw3pewVQoAxV8qbmneemR1PQticng6kdyWlC5t/H235F
X-Gm-Gg: AZFdTZd/GIfimvcT3XCG5DlkWGJvo2WqY01EVgPXJ8zuUtD/SNxQbRsB1emRyeZpw5B
	ACFvA0NiSKcOs5sKvcImn3SOk7mw7T84OILt9g39dEQ//rLDi+4nfuhc0sKPClxtZsqY/KFhucH
	O9rMj4qWpLeEJtVXmUcpZ9FN2g51mfHzpm5nzSGnenTdXVNrk4bC2sfKz/8/S4+sSQQ9HcJHQpy
	un44iDsgVV7KbaPZZbKIm2/318RO2cmc/2zrwZCft+pmN8fVKW5sYAx0j8+8jHg/VdWshu8dr52
	wKttp+whj6CXD80tGwxWp+06b6SaoH+YxIfTm1BbkBckWCvn1OY5j+EdQHPt5l3pBgVaS9RxQIo
	y3hVZq4uEynWltWmonKXK0mahgQZA01TVUJ2X6YaYepijtz4eRZzEkTZ69Q0GpuxGeNPncoI5tv
	oey8G9gAu7sSWf5KL26zvsnezAlJEW/IiROWNXzA2sHHC+QwpsB4qwaeDdjKLNA5oeCRLx+V09K
	1yOPg431xgEIme3tJjiXvq8UBbkKDHCQYDu/agLZPA55mrF/WpgdBoS6J1ZpkHe5HxIeBW8TwHo
	CeiQv8WJCuh+AhEEmCTZQCy0EIV+LdpI1Xu5/1cgFaKc5k5dEtBRDPAKKq49GYxH8g==
X-Received: by 2002:a05:600c:3509:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb88814d16mr374824975e9.21.1795597776397;
        Wed, 25 Nov 2026 01:09:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm558503985e9.12.2026.11.25.01.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:09:36 -0800 (PST)
Date: Wed, 25 Nov 2026 09:09:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: keyrings@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Alasdair Kergon <agk@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Gstir <david@sigma-star.at>, David Howells <dhowells@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, David Woodhouse
 <dwmw2@infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>, Ignat
 Korchagin <ignat@linux.win>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, James Morris <jmorris@namei.org>,
 James Prestwood <prestwoj@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jonathan Corbet <corbet@lwn.net>, Lukas Wunner <lukas@wunner.de>, Mike
 Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Mimi
 Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>, Peter Huewe
 <peterhuewe@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Garg <sumit.garg@kernel.org>
Subject: Re: [PATCH v2 1/9] KEYS: trusted: Allow ASN.1 TPM2 sealed data
 shorter than MIN_KEY_SIZE
Message-ID: <20261125090930.698d8f1b@pumpkin>
In-Reply-To: <20261124194043.1651679-2-jarkko@kernel.org>
References: <20261124194043.1651679-1-jarkko@kernel.org>
	<20261124194043.1651679-2-jarkko@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Nov 2026 21:40:35 +0200
Jarkko Sakkinen <jarkko@kernel.org> wrote:

> tpm2_unseal_cmd() rejects unsealed payloads shorter than MIN_KEY_SIZE (32
> bytes) with -EFAULT even when loading an ASN.1 TPMKey (OID_TPMSealedData,
> 2.23.133.10.1.5) blob.
> 
> While kernel-generated trusted keys ("new <keylen>") and legacy old_format
> blobs are at least 32 bytes long, external TPM2 tools allow sealing any
> non-empty payload up to 128 bytes.
> 
> Keep MIN_KEY_SIZE for legacy old_format blobs and accept 1..MAX_KEY_SIZE
> bytes for ASN.1 TPMKey sealed blobs.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
>  security/keys/trusted-keys/trusted_tpm2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
> index 30188a0ec676..d7336f25b514 100644
> --- a/security/keys/trusted-keys/trusted_tpm2.c
> +++ b/security/keys/trusted-keys/trusted_tpm2.c
> @@ -559,9 +559,11 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
>  	rc = tpm_buf_check_hmac_response(chip, buf, rc);
>  
>  	if (!rc) {
> +		u16 min_len = payload->old_format ? MIN_KEY_SIZE : 1;

There is no point using u16, just use unsigned int.

The same goes for data_len.

David

> +
>  		data_len = be16_to_cpup(
>  			(__be16 *)&buf->data[TPM_HEADER_SIZE + 4]);
> -		if (data_len < MIN_KEY_SIZE ||  data_len > MAX_KEY_SIZE)
> +		if (data_len < min_len || data_len > MAX_KEY_SIZE)
>  			return -EFAULT;
>  
>  		if (tpm_buf_length(buf) < TPM_HEADER_SIZE + 6 + data_len)

