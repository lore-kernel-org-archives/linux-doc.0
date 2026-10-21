Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599930;
	b=fCWkyM9oJ+AUiDNSbT3mgL8UWZzPS+WHazOL7KKG028b9ADqiDf1fyxC4SJUu7cn7qQt
	 GL58IAAfsqCdiWBF1HFJ0gfc5vwCP2RDtaXAAs+Yzoi0AN+K3suAuf/i+9EvzGKDgp2Bm
	 2qPe+9rHa14QiZW8wAcYVrIfwcF7VP60hLZNCJts+6Lu4jWuNr2+B5GEylJcolG+y/89v
	 UdgO7QH3vK+yJmXMo5H3Gv5/EFm7fCpWptPvdljYJk/HVVzOYLwV4nRQg7mbrXRmCII8l
	 ee9LQB4nB+f49csUBRCPYMPMpx63fyewA2su3YaMx04XDENj1aBgmAcBQ+iS9B0uRRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wTPDb7LIMtyEiz+mqYTBrrnJbHRN01tnFVsBBXNS8TY=;
	b=5dXn9ChpAIDoCiZqpMsKfHq/j1d+o8XWBMIgfF1lNIsoq4VplflEt60lO94hSpdxw0Yq
	 BCqj9wgXCXKyve5IPRz2t08E+b927f9GeEs1NyjCidQR9B1vxMhVmusdfzVhyCknhn0ij
	 nXu+tqflyAXdH1zZncw+Da8LqcOUbQNnMR3ZPGhHtlzZO3iXAB1xMkTJlmAoJza4A4cAl
	 eGeQOD/VezKzVnG+GudpbzshRNH+vGKnsVsqICV8mlW1zOUbZCMdQhPxo0PKenSRwCYUj
	 5xYRJWOeo6r7JIgIjmdhbAf4NwrLbCkm3q8gLEow8gzhtC0Rh3akDWOaq5Etzr3XdRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=nLldAXVT;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5986E606A31E
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5986E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=nLldAXVT
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c423b145922so118031466b.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 09:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792599927; x=1793204727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wTPDb7LIMtyEiz+mqYTBrrnJbHRN01tnFVsBBXNS8TY=;
        b=nLldAXVTDBPyUo5rQiH6wJRPeyGlMCQokaHib9EKVjff54+owMFh/Qp6vjiMk7Qk9j
         Qw+uzHSbcliTiERA0MKT3aFKpoekS12Hvsh9Eu61qJtAeSbh076VpqH6PzpIANmxvzvR
         IIwu8ZpXtSEz2iLmnRTJ3wC8qnPTWFM9COcSV9n46v+qVVAMc8C5NPsKz4iZiJl1gqxV
         d/kjXe0ZI1uEOwAcqMf+EadGjSx7dDpqLNGDKteo8my9cQRM/F9j+a6JqhC+sRPFku1G
         AyWSyMLmA3aLlvzRGRLhsZOdo/O5HostYUr1lniO+arQMkLuMwMSMkVgsTPBAI9MfX2y
         6stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599927; x=1793204727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTPDb7LIMtyEiz+mqYTBrrnJbHRN01tnFVsBBXNS8TY=;
        b=kMD8Ev9SImPZ91uQRYdUlqRFqV/cpgGqwBcSP18bEi0DQ+f3P5W5gY4UT8A8ZeHqUd
         LSYUIAB63KoVC2rDwCfkx9/HAaXph02evOeSRG/wCsXL3ASM0hdOgXOww0iVE95aGmh8
         ytmYCg0kZB39cFoU8SvubwHMySG7ATdE+Y6CVZWp+jGctXCrTO20gzQkvBvJuybF/tit
         yN5RaDPdpF4qEEUgWSTYigUTx2jnkuQlyhKDPkNpPhXX/obSvrugUe1HlZhnvTVV1HdG
         E5nPcNaRVDL9zLblD5JUj61oRzvuERSCahbfaiBqnZOTMjI/r26oUJsDh9Cgy0OUCKbq
         aLTw==
X-Forwarded-Encrypted: i=1; AKwUvBwF6NpqvWv0/LXHDn1YoT++SyznSug9jRPZ9SqSghUlFytuSpxTuqEIjPXQ/vGb50XCRyL5t8d2BL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdkXPKpNBIt0hRa3wc9VpYIz8xkNWmtWarlenJtRweRUUNZWwu
	etuShayjBwE/VVE+yCuVvTYWK4tmeHgcPQC4LjkxLs8oE5graeAHZe/5W8T1w5Rw9LM=
X-Gm-Gg: AYBFou0afLcd3+uWG2SgCijcpMgH8U1CzJ4cpmbXbdLiAQ4CdVQ/qlJeGZz438bvOYi
	Pgxo4z+RetU+xG31Vg32WcgVO8za1y9TiAlyne20dHx74O9WMwd3Znor6HmsCVCuxe9Av0I/8Qy
	vT40dP1THqcdyyI79RqIXvVk8kXcM1af8WUEYyC7I1Pp1dY63Ea0FC01XiXxLOa4N+stsWNHsS5
	qA/vzjN+3MQ9Ug6KvMXZhEmoIRXY0JeiMjV6w+cDfMjZGFXbP+vkQ1gC6UiNJOGHwXkKbLUFiyc
	TYUJKiuDnbO0DwGf1dU717L26v/wbDqNtmX2F0Ah6fHotPRkSQbngPemkvYyoI8OHpRodyRa8Er
	aOW4mgcn4gvSMnUFcKSSJNLOImK8PsAvt3iT4JCd4PJosGvx90Vv5ZqNTssyBdxQZK38uAHy+oJ
	nOXGRcInQsZpDa3ZAO414I9t3JZqIEgKGdZNwSk0eDo+zvU1GeQejKF49/6wM8qv3ZKDVpNQNn+
	KyYBQFO/1O/o131ooT2zUL4y9Q2TqyzzsK9346Lojol7T0mXSTpgxn+eofb5QTW6aWT
X-Received: by 2002:a17:906:dc91:b0:c27:420b:7c79 with SMTP id a640c23a62f3a-c4679a40b62mr221295166b.48.1792599927374;
        Wed, 21 Oct 2026 09:25:27 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a6182e8sm17768966b.81.2026.10.21.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:25:26 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:25:23 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <atjnZ9oVYZN1VnwG@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <20261021003056.354a40ad@jic23-hlaptop>
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
In-Reply-To: <20261021003056.354a40ad@jic23-hlaptop>

Wed, Oct 21, 2026 at 01:30:56AM +0200, jic23@kernel.org wrote:
>
>> diff --git a/Documentation/ctlv/abi/ctlv.yaml b/Documentation/ctlv/abi/ctlv.yaml
>> new file mode 100644
>> index 000000000000..fa11bce98f46
>> --- /dev/null
>> +++ b/Documentation/ctlv/abi/ctlv.yaml
>> @@ -0,0 +1,186 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Checked-in ABI snapshot of the ctlv family, written by
>> +# "make -C tools/ctlv abi-update".
>> +#
>> +# The checker compares this family's declarations and inherited stub fills
>> +# against this file. Updating it is how a UAPI change gets reviewed; an update
>
>Slightly confusing text: 'it' is unclear, checker or this file?

The file. Will reword.


>
>> +# that removes or renumbers anything, narrows a bound, or makes a placement
>> +# required is an ABI break, whatever this file says afterwards.
>
>
