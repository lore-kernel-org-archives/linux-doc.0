Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784E257843
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407115; cv=none; b=YXAJ23jnhyQpXFDTDF9MXkLRBsV7HTIl87nUYiYaA6fYGx4dJxiMFqtrUoCfo2p+V8UD86Ga5LjEgC61pbL7ywE/GRl5BoLJNT2gcf/B65hrEQRlKEh8NJ8meAdyY588mFGKEAGTfivfKxA7isTKSAGw9xbl9uL4nEL1I1LKQR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407115; c=relaxed/simple;
	bh=QlDMUd7f1JdkVm7v5UibiBKuEOhJyK5M/xPgVuOcFWw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cNqSl8uPAuhCxEjwZ1Lj2uyu+IpV0QkKfwV+MQbW1kwZ9HZfoiH4dWpmUSIk6EwuS498z6eXVi1o7jNZLOgX3G/hgLblhSzg0SbA3GPjbYoiQ4qgQA6vhMdnVTmkp2T70kYrqBAxWyMziGccQD+PyEOyJIjjI3XGx26+jHHqRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CvREDk7z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y3LpWzS4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CvREDk7z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y3LpWzS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773407113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlDMUd7f1JdkVm7v5UibiBKuEOhJyK5M/xPgVuOcFWw=;
	b=CvREDk7zMi6sCHiMzb40vKY1C05iRasLiu3JqwWlzoZtcKcSeWP8ySgvEZH2l+fiex5S8e
	TmePgUUiiakM3Svwcrp/uxUS12YpDKzuRg+rpGv3uUwoIBatnz0Gai8mOXY39HJi4IBMNJ
	NImHBjClI+DlOWQJbGyLPV7+42MKzWI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-Wut32rqBNnWBV2i2qPDDJw-1; Fri, 13 Mar 2026 09:05:12 -0400
X-MC-Unique: Wut32rqBNnWBV2i2qPDDJw-1
X-Mimecast-MFC-AGG-ID: Wut32rqBNnWBV2i2qPDDJw_1773407111
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4853040372fso20266115e9.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773407111; x=1774011911; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QlDMUd7f1JdkVm7v5UibiBKuEOhJyK5M/xPgVuOcFWw=;
        b=Y3LpWzS4sXas+hx0U4ZnkIVoNxwF267HXtG/xQy1ocngsECA7dvgKkX9eJbTx2WIPA
         4xXW5hDnRWcY2oos+qZAC7u3+DQOfYB5toZUOqUdQWd141+CGybKWTFvtmcJxUdwZQYO
         2heN5YFH5S1EFjel4EhicdrWJcGgw+PaErI5ozwMKyzCKS54+q3TE7JpzzrCYRPCTx7P
         9FOKEXPbocArp8tm0IZ5VMBnGOrJRbt3NNHA2GeIBQpzWqgjTiMhcc+19DxcGoDblvPF
         nk7oEyc6xTl3TCyLYRqrlJX6yfx7c/+0MnDILv4I4z2demrRg34XtjDdYqmpZiUD+Mo9
         s8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407111; x=1774011911;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlDMUd7f1JdkVm7v5UibiBKuEOhJyK5M/xPgVuOcFWw=;
        b=KQEiTdvminSnF7dRNr6FeQfnNwJqOJKL5dKnoNYvRdPTyQI4aMouQUIeROQGNOMcKe
         vWqaxdxm6AIJyXskAEcd9RryHXdNbzRLoxz9TfV3rJLKHo42vk+rn+g8oIorSZBFLtoH
         irtizHS1kCee8fpERbgYkROTzOtNX0z2eQngfNT6BF778RKmJlkCFmuoEQks1TdKz/Yp
         C++U/Xugl6wvJnUDvLk6WG033CkrdQuZErF4xahnZmcDRLlxCjU/manyAPRpaYSzd68p
         WAMFSmIDkhpziCxgPjplFz7pM6ML31fR/0FKiSKC9zHdaIIMB2o5f8pvvnE8rbmmi12B
         IKFg==
X-Forwarded-Encrypted: i=1; AJvYcCVjgD/aX8QwiUezCxff11le/LiZ7vKIEez/DCBuVTHEwP13vaMKn6ek8I7uvwoS2P4uBtDKFhSPCXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw945XHWTLhptnU+EOGiWbh7Fs9GzlW/NAw0R/8tJQMAHpbCEZI
	Z/SzD4AzOmbYx5HLMImT2L6OerU3X/b3vuMWt+svvHY62YzfvDTgohlSgivkH5mrtW7iMFhU2GD
	PPP//y3kURyf8QbHmsAeg65BxVEy7irF2RRs1IkZCGTp5pm5rZspXTkwGBpWsrm5R7FnGbQ==
X-Gm-Gg: ATEYQzzeP0sRoPPSRoXT7z4GkK6LIyMrzOCumO9MvDawyB5RgnaD/vVM1Tu+mzx1awH
	ONIAfpammoftGlMRdVCTHlRars3uX/TDTg7T2uFnaUssv1MMvNx9STHUPEsVfsLB52sjSSHI0zd
	kX6S2EI7hSFqHKkeN/dRf0LA9SuBeiI/uW0DShmQC9OykNKezzQGiHH5nU3aHaMe86+4vzrcLp9
	MyDnD938QjOM7ahZzoHfQLLn8rnYvbUM7uKFnASU1wuFR0h8dBnJ6/PNzzYQpSt6vmRrVd0bFUw
	qte6ZL+1T1Taa7lGt8PYRkHzfSBKq3a41GMxuGXgD7fsh+V0FLmYKpE/Gqldf9tUW00kqh/umvm
	aBj+rnqmLo6q8ZMPzgBww3+eM9A==
X-Received: by 2002:a05:6000:288c:b0:439:c9dd:cd5f with SMTP id ffacd0b85a97d-43a04d863bfmr6367814f8f.19.1773407109286;
        Fri, 13 Mar 2026 06:05:09 -0700 (PDT)
X-Received: by 2002:a05:6000:288c:b0:439:c9dd:cd5f with SMTP id ffacd0b85a97d-43a04d863bfmr6367443f8f.19.1773407106833;
        Fri, 13 Mar 2026 06:05:06 -0700 (PDT)
Received: from [192.168.1.166] ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm20184469f8f.27.2026.03.13.06.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:05:06 -0700 (PDT)
Message-ID: <4620e92b1c7f4d87f192a017f3026dfc17bcaef6.camel@redhat.com>
Subject: Re: [PATCH v7 05/15] Documentation/rv: Add documentation about
 hybrid automata
From: gmonaco@redhat.com
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Nam
 Cao	 <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>, Jonathan
 Corbet	 <corbet@lwn.net>, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,  Tomas Glozar <tglozar@redhat.com>, Clark
 Williams <williams@redhat.com>, John Kacur <jkacur@redhat.com>
Date: Fri, 13 Mar 2026 14:05:05 +0100
In-Reply-To: <abKX1XO4vqY74uA7@jlelli-thinkpadt14gen4.remote.csb>
References: <20260310105627.332044-1-gmonaco@redhat.com>
	 <20260310105627.332044-6-gmonaco@redhat.com>
	 <abKX1XO4vqY74uA7@jlelli-thinkpadt14gen4.remote.csb>
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

On Thu, 2026-03-12 at 11:39 +0100, Juri Lelli wrote:
> Very minor nit, feel free to ignore, but ...
>=20
> The formal 7-tuple definition includes 'i' (invariant function), but
> unlike other elements, 'i' isn't stored in the automaton struct -
> it's implemented as generated code in ha_verify_constraint(), IIUC.
> Worth a brief note clarifying this design choice so readers don't
> expect to find an invariants[] member in the struct? Here or below in
> the example C code section.

Thanks for the review! I haven't really thought of that.
At this stage we are not mentioning any struct element (it's purely
theoretical), so there shouldn't be any expectation from the reader.

Later I mention "The function verify_constraint checks guards,
performs resets and starts timers to validate invariants according to
specification".
In fact, also guards are not represented as part of 'function', I may
mention after that sentence something like: "those cannot easily be
represented in the automaton struct".

Not sure if saying more wouldn't make it even more confusing than it
already is.

Thanks,
Gabriele

