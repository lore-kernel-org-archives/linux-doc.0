Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACEF3FD14D
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461391; cv=none; b=sMfABHIr8qRdTm7UzkuLtMu2nob0oGGAqe+UGiA7EPQ2VTYASZJLg3Qn/xjsOa9K5ZoOvY/AzfxxjErrtgh7NRm9qIfFlPGTfyeruCZJ1fvy61D3VP3Zo1RldNMt+xNgxRZhapEypr6ZzeJb91LjNrPZqIfCD5RuX91bss1gnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461391; c=relaxed/simple;
	bh=QW9ypdWvYAykTWXHZVGjV3Z3yGnr8z5bcSPNh057HrA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TvxEEk0wMI3b5gVcYWxNRLDlqfs5IM3p5ckqAMiU0JLcb1AddzHNM5UybTG5Y2ya7gj0PqEwDivD/Tw9LZ+tiQd5VOhAa3gOqM+CrpprBWV/uZ4RqhKkIoDUfGsrqxkp1ZhkIxWQdT7UCdqwnDDo/a8WmDO/nt0SLfg/XCN3OjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JlsEbztc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ms0n20OM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JlsEbztc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ms0n20OM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772461389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QW9ypdWvYAykTWXHZVGjV3Z3yGnr8z5bcSPNh057HrA=;
	b=JlsEbztc9bDVoMXxIVQs6cwArhPZGA9ItQf4lnW8kbqX3BRJuOh1uoHq3byDe72dn8fg9B
	7veJrkx2fBlb4yJVgZ2+lzADl3uzLrDXd67Q4z/qcWlGniONYIIpQ/8Pf4+NS93gvaK55u
	dYspKeYo5bdrpUvl3OMGUm4W8vB/Nqs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-mRddmChaOHepoGPK0GR-YA-1; Mon, 02 Mar 2026 09:23:06 -0500
X-MC-Unique: mRddmChaOHepoGPK0GR-YA-1
X-Mimecast-MFC-AGG-ID: mRddmChaOHepoGPK0GR-YA_1772461385
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-483786a09b1so44114905e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772461385; x=1773066185; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QW9ypdWvYAykTWXHZVGjV3Z3yGnr8z5bcSPNh057HrA=;
        b=ms0n20OMp6pAdcwnSBCySvHsQPIBG9Mn3+jmDvakuTfoyYpqc69DVFgFRJPBQnQcIO
         YvNHhEVShFPifFInqCVtPB4WO2y8nzFHzZOXibaEdCkA3k09MFFVMPc37vYZE/ZvFocN
         gcxD5cTFxvLNjzeefL4AcZNIyxCxKBJa6nzWrgnRnSnYkt9jga10X8RdEGRFoHI+EoDM
         SW0UA+hrAGgwkFocWy3ruHcykVPEZQ2rsTjCY07EKoL1/LIlu2kKkhQPO96wB/TWx5Pf
         JDKxHI2JOvqozeUC5++nbsmnPw9uNZdwVxLY4Joq7G19XzZIrOTdcp+YnpdEwKrqpE92
         T2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461385; x=1773066185;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QW9ypdWvYAykTWXHZVGjV3Z3yGnr8z5bcSPNh057HrA=;
        b=ENyvSefjE7P8BoIoXpdCwGpp4nBVyloM7HvtYEvPV5cOjw+tgzO3Vcs7nu9jjwNIuh
         qIc3ETOkDdaRIFvzdukR7jnFvLqnv3IkB8pb2uKjiTKj8eUu7dFe8hAfaeXH9QeFOnLZ
         bFMjHBhdtb2EcRRzaZAyQNSB+Viau70mYUipn1P73WPpAauSK7YW0vPsTCUopJUY3jxy
         V74lxMudsmnYR3Qu+cMptpDbDLJhYeiXlIxkdFmkamaOsN+InRlvQlueOmyrw1TckK+r
         tGa5ZPDfLemNQBS4xN2CwxY+OxCn4qKjl73pSoHVvsL0uAFfHrwjZpGY74Wb18U+fK6W
         2Zbg==
X-Forwarded-Encrypted: i=1; AJvYcCVxu3OLNnZmqNBliFKTD0sO9Q8Sa06JD9NBqLR+3pva+WeFDiDeUqDJvTk8375Bdar/YGnltYAt2fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhhaJKoJl0RwMtdY60+ewm33Zqi0icdHz2IZL2rKkHb3BIn8p
	l7E3bGkvGuMAudAcZYIjgLGtfb55QmNn9JYW9OmqO3aNUCz1dgZn6Ek6sBriBSlLq7maxl+6XLB
	u4Etyg2z3W5t3ojnM+ZVCxyuNwrfh79aeeYSBVnKluWX4mRG0QJQa2eKBsbx6Xw==
X-Gm-Gg: ATEYQzzYncnddyckZPT6pFZ+VLsykXXTcp42/Sy/34j2AAp7zNlfz58q3Tupk51fuy4
	wUB0kXulPXG5jPpLvtPXjZCW44YptoEng3NDwY+1VBN3FnZzY5ZzoCaWqVQMw6xNF1Nsnkj0lSe
	TFszQuPfmSl+R1laInLlH7MEh3JIr/1O/HQA1dZOpg00Tz3iJpUPATtem6Q8vPfk5YsD+It3ybM
	UdOChLeXFyuHNIuFOxO38EhKNR11bWPcihQMXcj9GTI82Gh2hpy0TSziURh/JQ6PfvN/Zh8VNsv
	ova1lJu5yj9+eSVvD1AE2qn7yBBW/1Ji+zvSJeyCMNmf7YZdoeSId/G1w/X8VnIY45G/piPborE
	mdfpKrfeuZoTkbdhRkmpQdftxWsHj/eBsQA6LiGkBRDXYqXAk4f9d5BIB+YSiVhuKA9gpkl0HsO
	Bt+zS1wPMzH3t4nCk=
X-Received: by 2002:a05:600c:b86:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-483c9c196a5mr202664325e9.34.1772461384982;
        Mon, 02 Mar 2026 06:23:04 -0800 (PST)
X-Received: by 2002:a05:600c:b86:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-483c9c196a5mr202663525e9.34.1772461384505;
        Mon, 02 Mar 2026 06:23:04 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm664794975e9.0.2026.03.02.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:23:04 -0800 (PST)
Message-ID: <8e8010800fe403137c70a7627239243c0cbb0ada.camel@redhat.com>
Subject: Re: [PATCH v6 05/16] Documentation/rv: Add documentation about
 hybrid automata
From: Gabriele Monaco <gmonaco@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Nam
 Cao	 <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>, Jonathan
 Corbet	 <corbet@lwn.net>, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,  Tomas Glozar <tglozar@redhat.com>, Clark
 Williams <williams@redhat.com>, John Kacur <jkacur@redhat.com>
Date: Mon, 02 Mar 2026 15:23:02 +0100
In-Reply-To: <aaWXmBVIvTlVtiRp@jlelli-thinkpadt14gen4.remote.csb>
References: <20260225095122.80683-1-gmonaco@redhat.com>
	 <20260225095122.80683-6-gmonaco@redhat.com>
	 <aaWXmBVIvTlVtiRp@jlelli-thinkpadt14gen4.remote.csb>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello,

On Mon, 2026-03-02 at 14:58 +0100, Juri Lelli wrote:
> Considering the spec above, does the 'event' need to be 'enqueue'
> instead of 'sched_wakeup' (or the other way around)? Or maybe it's
> equivalent?

Good catch, in fact enqueue/dequeue don't work well for this model (the act=
ual
stall monitor uses wakeup), but for the sake of the, already simplified, ex=
ample
I should keep it consistent.

Thanks,
Gabriele

