Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C02ED16B
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 08:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766433; cv=none; b=dBdMWfW0C34JAXJDhIQaq5w3ZaA49HTmNe5nxuiiLVso6K/5b1QxLb+vH0nr+irNTxYQarine+g8LMW34vURkzNKT2zr06VENcHKKgyci4qeF1Dh6Oz84sUUoUFwXV/yQLk0R+kjXPbuo2ZiwtDUhuTdS33WNEWjVd9zVHSmtWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766433; c=relaxed/simple;
	bh=aBhzP6d3YQDrwI7ND5rpwO6HjIyfUepP/sZomCKrjm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1JDOoQCfJNMpoV429LgJJrn0y7zEXNUkndiNtnZW0BmSnJl8p91P6YdkVwvDcuO6TqZv5NaCpiO06q+/yz8PYHy04ZLqRQ3anqOx9/34G4PLgrwKUnV5gNnic92bq6KjvERS3Gtgd9Hnl9h4Z4REHcqUsSUGvPjmdd+kk5W3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gZ6ZQ8CL; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gZ6ZQ8CL"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b297962b9cso6994661cf.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755766430; x=1756371230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBhzP6d3YQDrwI7ND5rpwO6HjIyfUepP/sZomCKrjm8=;
        b=gZ6ZQ8CLB54J23MX/pt7FqW269gE8bsMDwn21mPtLT1bevECMXpZpl21m1w6brOzBu
         oD6kz2uLAhFXuUSa1JYnGDvF9Zlm3WtzvlcetMDIrjNtJ0N8w6WeE4ioy+2F2bq4Mwg8
         FsI+nj+q/zSl48nemYBRa4/Z8uUOB7/vrRKfzt5bkWvrb04M0tqPX1r4prY/Iss0AMs+
         6T5MhmhMbywueAOuCjOS4vHAwZDOcrkq2nm2esudyoTgS0uBf2DfYxynGv6Dw7XH8VG2
         CVzWYtowqIDYUI+LP/UQOdn6KpiezjhugF9HtEkJ3YEULL2oQ0eXqKeg08ILMfKcLP/U
         rXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755766430; x=1756371230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBhzP6d3YQDrwI7ND5rpwO6HjIyfUepP/sZomCKrjm8=;
        b=jbSbRZnEqOoqg9VE0M6TxWDVVSsVZaJzBUOwsxLtMKLrziGPiNnZ/OpNU8xcifSM7M
         lLCyo3tr3piS45kCNdUz7tK7n2HREqAxBfIGoSUTrkxlz/MP0nYUGA/WITssFbq4C6bO
         UfstHe4WmT5G0gb8O3R2eSivXXNAPdzLD+dm6mbYwJ2m0pQcbT75q73Xgf0yLUawb6kI
         HMvvcwqhPe2y9ER76lVbL2qb01M6tdXVgnj4Nu77hMdo0IZgfSdINcQnp+W+G9G/zK7B
         JxcemEfQma5zLpLzXnPNX51tmpfsIclyw2icOJOyLxq1RJfq4YbTBcMtntJ5mt0aMj3/
         1baQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEhSMhoKBuLTx4HZq6vZ9H0u+ekuG/rkF1QykXuk/hJ1GGo3SRtoabfnl8kkHGOXWpf436puWAMuc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy5Fhu1JiJr7coHmuZb++cWcZiBIw+IQg9P2g0c5t5VbZmzb5v
	fkogiZL2zrFQolDtWZBxQ3CoJduLgtG9rISotocktz0a7Wghn9ca8gsTMfaChvYVcBiLMfwY29+
	DKAqL4y2czd8XCXfWWVS5YEY5+bnMv4+tln0U7g0y
X-Gm-Gg: ASbGnct/Dqz9v1dQ+pI1l6QTkthK/BT2dqTpcFBK4vZPa/CLWjN+8W1WdJQfTCD2Pvq
	kCXGl8pmMfM8JzX3RY8DwRjrm+McdXDir9/4j6qQPF3m6+0+ynQtY1r0iPSpAvEgBkMA2KUxp5M
	FOemzPoZBOgS6fr/696vPofmOp4PELGcmaTmrsB/UbHwJTHFf4Wgp1xoOBSzs4/dWBEOhlF5D3v
	4lYgMLqESQlLd3uUTHp1iMZag==
X-Google-Smtp-Source: AGHT+IFv/PtcOPUQj2eIhfJGxSY/JvZ2K28lWNXCVsP0qeHLxlQhiCXLQmPIYrOD4LLNF/m/ke6DWecfHMX5teVadAA=
X-Received: by 2002:a05:622a:1115:b0:4b0:6836:6efa with SMTP id
 d75a77b69052e-4b29fa33f1cmr12068061cf.17.1755766430147; Thu, 21 Aug 2025
 01:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815083930.10547-1-chia-yu.chang@nokia-bell-labs.com> <20250815083930.10547-5-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250815083930.10547-5-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 21 Aug 2025 01:53:39 -0700
X-Gm-Features: Ac12FXyHsFmM4Y6s9A4jizpJZU8-dSIL1pxwxTNu7e_RRTYEAUIKywp1b0fLC34
Message-ID: <CANn89iJn24y7pfqOL9unDK2WX9wjVwTRXjsY0ABdHtxQzexS_Q@mail.gmail.com>
Subject: Re: [PATCH v15 net-next 04/14] tcp: ecn functions in separated
 include file
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, linux-doc@vger.kernel.org, corbet@lwn.net, 
	horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 1:39=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> The following patches will modify ECN helpers and add AccECN herlpers,
> and this patch moves the existing ones into a separated include file.
>
> No functional changes.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
