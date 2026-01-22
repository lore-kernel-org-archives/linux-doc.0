Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D7D35D60E
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 18:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106532; cv=pass; b=Wqvs7k9fVrWVSWQaAL1/+c6XyZuzFy0yBag1XzCom+DOCaAUzBH6fMRA/VQCvb3MKP0GsAXpSldCwJFN1/fqSuSSiP9HgOMQ+xsY3y94iDQ/jfwwmNVsiYF43t2uE1OiEm8tndJ1kK2o2lu50lp9TF81GujNwkrfcAL94rLeyzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106532; c=relaxed/simple;
	bh=s141jUdVp2gb95DIykSNVTQW8vBvv3E+YN1KG4w0fxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtDEfh2Vauq1gHMzee6HSop++Tlia/U9d7xyM7I5o2M+umjNaTZI0p0ONdyKVuhDAOjoSSt5XXPREWxAbxq5NDq/aYJMTa1KlxoFjMoJ5olRPwjtXmN5IbSGerHR1W/JhaJ+rsRL8ioA9r6zWLh7D2kkRjl6GuRr89r6dU5ZTtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=iGbJ28UT; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="iGbJ28UT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so2367536a12.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 10:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769106515; cv=none;
        d=google.com; s=arc-20240605;
        b=HKgD6hiKVZPzsM4veGtzD87/PhjTRhyolNSqbQXMDd1apXjcRqh3qvyK9Vdh+kMlcU
         /d71jb+o65pDjJfib4B2xdFBH9L4x07/5vT4RRXrWC8b2CJqH2VIxS/Lp+RDQkewOmpV
         CXa5HIfVyhwwwssm6NcJYrtDZG8I2+vEeECUTs/Ir7zhfA7fVqxBz4QfTXgnJOaa+hTa
         ruN/syV3HqQzyyteGe4YhvY83uuk3myzLGZIgVJonVnPuBb022eWrHldXX5dHz2M9Wrs
         gOMPNFcNs9qr0lkExV/d/g164+R3plpw1g84NxBL8R/48sD2BZaWeeS0InN/1byoLqoE
         Mllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cmMh+ovoeRUCCwfFygbXGZ6j9n5SptMlw+qIxplX4y4=;
        fh=J1IZu5iLpbqdS+VylRmy2zVYx3Cso5uDy0tlY/CAaEY=;
        b=Le+XYSdsF0HqZqmbpUMgqcjSLSIhO2bStfIURTezBjPlV53x6NzRH0zz4Wijwv4v1C
         BFH5w1LAqZq7XZpKsbt3kcnswfQr8xABqEo+KvDimAS4RBrKpE4S3Yff2Z8/4FJq09mH
         3L8G4esdBqQWx0sg0cAPzKjN1lAq7jXD7VPUmB47LsGMZbmQ4a1oItW55kaMcYoVpjJQ
         8QVKVmZGwC+GuDo1KcOxznUPaOWZfYBL28w3hMHOBAIdi8b1HZmGGIkS6i9L/M9JqLzi
         itYb8lfZVTErtuiPezJu2iOykDkfCM3sq4cEOTObFyOh8WzbTzJbiRg2YooCA2DdPurd
         3pxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1769106515; x=1769711315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmMh+ovoeRUCCwfFygbXGZ6j9n5SptMlw+qIxplX4y4=;
        b=iGbJ28UTFlNWijmtcywo3i9oi9YUXw14YHnEJu7OwVSPuHO52EubEClOf0xjzS5MHi
         hXywWNWMUupoHEOXXW73DvoeoXZR/l8NcxVyjoSXFQnsiiAFkK98mkpd+gYFfrAW88lj
         BYtYPMM5HchsqvseRqWqYCAVehxfnIQn9HdZDB0uq40eCyf/1f3WE5+15fvt4W9WKcEp
         DjMaPXtZQShrK96Z76kjdVrOcHT6ZqddfsWI8Oc0xftApFUlWxjSACE69mRqeDxFKjj9
         ioFqE2aef23wDJ2bnNxopGbKK1/7vHZIPqJmw4j9dO497hNMuMjH+/nKj8aUrMrjQgaY
         MbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769106515; x=1769711315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmMh+ovoeRUCCwfFygbXGZ6j9n5SptMlw+qIxplX4y4=;
        b=sqLCe/9eRylIwWbG5leTJHWr4qNvRHwswDdaTFKOywN1AsY3nGTKuM2EQ7lXV2xq+b
         YvuRwbmt1PB7IMcQulnX5/IZY183V+DhYYJhJyow/FT6R2wNjEG0vZiGI4/W3EN896Uc
         36bK+N/sxfh0UJ2uOqXcXv4W8/imyXSMsiFnNObbHg8LLv8AljMMJ66Br12UngAb/Ntc
         t2b4XNr+Q3J98idd2zyXzA6KaqjzTAvKKhl/pQf9lVVf1fkQEvM4mjcmdPK0S4514q2n
         RlvYyfrdN5Ht65w4g8WPjtMj06mlucmKXhKTTKELLvFuvmrTp+hiEGlH8JIq9TqQJ7X3
         Z+vg==
X-Forwarded-Encrypted: i=1; AJvYcCVJJX8JbcL+fft4oF+Wu2UQKiwgVMj9H8Sw229trNCno0eXIRoRS2M7UuR0HzHTUdMnSRdIq27p3Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGk+YhWtzUe4vEDCfV0Xa6+h78s/Pda2jW9tBLBLAueDg5YgYb
	w4zHtQ/0yJKu5mtV7vzeblRg0NAw5Pa/pAjn0lI8NrMzahfvh9CAvbQSUd2QCUnbI3m9pzoyIsc
	edrRetKTAMQWMDjMXcw+BXGl8WihbbNnaKxLUsgdryA==
X-Gm-Gg: AZuq6aJe1A+nf7FmGW9dTb5uamUaXNyccEMk9D9CJUbB3piF519RmnxxX1picGqrNsj
	26ElN2aDFUrCKrmTQR3hQl9YsmAchEgjcytekFsHdZJccLGhuaAnBi1gpqkBtmGjWNLqsYs1yq+
	01/81isNowun/f8fWLP7m1DIhTw13Tt64FJYSj3Zmay2VJ8vAIQuJCVtJoXUbGr5hOb6xOnBGQm
	UgMJrpuc8wkystAXuaxSUyrc8MbMtgutC3G6OOPCim51ZEeJm9EI/eViWRbsVNfhNoq9MXFp3xz
	8crP1UyTL0cvH79xce+Evo6H9w==
X-Received: by 2002:a17:907:25c2:b0:b87:1b23:cad3 with SMTP id
 a640c23a62f3a-b885ac40b17mr13522966b.9.1769106514941; Thu, 22 Jan 2026
 10:28:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105165839.285270-1-rppt@kernel.org> <20260105165839.285270-2-rppt@kernel.org>
In-Reply-To: <20260105165839.285270-2-rppt@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Jan 2026 13:27:58 -0500
X-Gm-Features: AZwV_Qh8LphdBgzf-rB2D4uKAJkXice2g_NEcJK-xBvMhkC97uW462CJuKpoRTs
Message-ID: <CA+CK2bDkVtwrCB9Jb=gSNC4CLgROJNHChjBPP3yYcad5y6AeUA@mail.gmail.com>
Subject: Re: [PATCH 1/6] kho/abi: luo: make generated documentation more coherent
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Jason Miu <jasonmiu@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:58=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> LUO ABI description starts with "This header defines" which is fine in
> the header but reads weird in the generated html documentation.
>
> Update it to make the generated documentation coherent.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/linux/kho/abi/luo.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
> index bb099c92e469..beb86847b544 100644
> --- a/include/linux/kho/abi/luo.h
> +++ b/include/linux/kho/abi/luo.h
> @@ -8,10 +8,10 @@
>  /**
>   * DOC: Live Update Orchestrator ABI
>   *
> - * This header defines the stable Application Binary Interface used by t=
he
> - * Live Update Orchestrator to pass state from a pre-update kernel to a
> - * post-update kernel. The ABI is built upon the Kexec HandOver framewor=
k
> - * and uses a Flattened Device Tree to describe the preserved data.
> + * Live Update Orchestrator uses the stable Application Binary Interface
> + * defined below to pass state from a pre-update kernel to a post-update
> + * kernel. The ABI is built upon the Kexec HandOver framework and uses a
> + * Flattened Device Tree to describe the preserved data.
>   *
>   * This interface is a contract. Any modification to the FDT structure, =
node
>   * properties, compatible strings, or the layout of the `__packed` seria=
lization
> --
> 2.51.0
>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
