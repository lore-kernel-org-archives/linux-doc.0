Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7936E472
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770397786; cv=pass; b=OncatJqVUS3LI6oqNmesmhnTaRit/25z5ekvn8zW0nS7NKrPVhipSGnst+lgBxAfynk53ROL711TxOIyK6qxXl5NySbE/omaHH+yUXJ5puE5pYB1A8r/piWJJ9b+dwp//dpRVRI7Am+E2JdL1MS2pnYZS7ID3/NhFWaEBgz3e2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770397786; c=relaxed/simple;
	bh=2D3+3zXtP4JhUK7/PLg4nJFv+DRLaz8NltH9x+kquWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PA7nYQIMZUH+9s7wZoJQ+A68AoUKhbFA5eeNr5KcjrhaovnPakgFdqXsDpN2UAuBCloAH60lmNQxsOfdIvW7zs1Lb99s6xd3buzhQMc3IaHGscoOsch2t3ijTG7hLRSWiFq4K4lJwXeKQqdkLVWSwcHEBxVTgZJbYNEI/Kunl6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fS0z7GCT; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fS0z7GCT"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50335b926c2so21741191cf.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 09:09:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770397785; cv=none;
        d=google.com; s=arc-20240605;
        b=Hq95D+Hu0Ud1XdlsJM/Es5/uAEjT74IbiyVB2D/lVRUtOKDMRHSmcMRi7EqXJlW09g
         Rfgob5u1Em1USnxlk4ihbyh6p1dUdzUdxfl964AX3TBDNZk3I5Y+tx+N7PkW7rAjdB/G
         qB3lnfQ0/tjTGpMhq6eQx6bhTy2Icoc7zSvpLe7JfUn/l7S9ECbXxmL8MkQakk2Oqw8Z
         +iZhwcl8fu85phcsjFEk8W1zk8sZPatFOKYOr0i+8d5YjCBJaXqfLQWLCJG6u2Q3jk9Y
         cB/2IPo9Em9p5G1acwuA7+hosHXW/CjtGtDhBkgvKjoneQKiec/6kbC/VPyGaT6jJO88
         PHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2D3+3zXtP4JhUK7/PLg4nJFv+DRLaz8NltH9x+kquWQ=;
        fh=+ZhEZ6tJAcd1qVP0M14pTrUIhSdEeve8ArTOTjdZTPQ=;
        b=cjexEgvHW9TdDgfT+2D84DiWsHRE7MZNNF/2hGSrKVMY2uLMgu5eEofIC+CW0gzvZl
         EMr2mtVMYi0pjzwUBhrGX2iansaykUUHcw8yLWtJna4h3HxHbz+DAzoKZ43I1uRxEW2u
         q8gu6gzMnK87KEzaQCH3gz10zJxycHfTx25fcJ1O1Qn/RRfyPSHrXgUfZ6C+GOtl2W2J
         IPkD+zcwDp81T5L6qqWGkoLEn46IUCRQxrNYN9jQfZnIinc/TXAdQc0PyNFKhqNtvoHE
         nSZRTjFlGmhf8Kl3QDtrybw041OLsC5V76o6vOw5TLMITBPYzwTXjNgbkerrZx8OgJbB
         HtQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770397785; x=1771002585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2D3+3zXtP4JhUK7/PLg4nJFv+DRLaz8NltH9x+kquWQ=;
        b=fS0z7GCTc6IbYxJbbtmxP1sW7GNzMyPHokXsdBggcMMvZwxD8wcnyVqn58ub5RkARI
         N29oWTcB97VObPMPz5nSdybnHVRrubxuDLJ4Y9FyEvRsBmPbeQZPpDRATerOu7d1agp+
         PP+L/WQ1IVILvORZGnV6wje4Zg9toBa3shFmntM3hex8oLQOjj1LoRiThBCX9viYfW98
         uamfynpWUp/mtfXsFOiMNsV6ARb+GCrBMU98oCaJU8+ZXjwUa7LnJyMKYT0QBWNtckhV
         qyObzNR+3gLfPFwc5TJ+s6YQOJOgItgxiC/S5cdFrmS+L+22DjPt6hW8p4pjMXAMOF2c
         Bj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770397785; x=1771002585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2D3+3zXtP4JhUK7/PLg4nJFv+DRLaz8NltH9x+kquWQ=;
        b=rBahoYyxCtF9dTeKv41ZtnWtDvLtHilVVRmeCOwMJQYHa7PC2aXtIpVAMmfkppxpoY
         DAyVFiNEY3C2q46atsO02VK5mWgleWTYvuIap6JpH6cY/ZndxOpimVYP1CG74/JEvZ3w
         Z4c1UPU8tQGCLIgyTF0Hr3KdqBDzEqroyANrKXwq222NBfpcbND7DhQtLa3JCpFCh3Ec
         EgKZueWIZF1adM5XXvjKnE1c9ToGSydk1F4tB/9VxR4VAovUpaQHUCnmu5vHA/6jA/x0
         1Qd0FwtkbCpVEefOUbXvwGhOzHup17IB/vzbF+PvMPiISQyI4EJCkYEscy+GbX9bUTJ2
         dqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV35rVg2cqhov33LfgPwAl4b56lqPlryCH1pCzl0o6XiSpVdQF6xr3AOhqj0ypDED9N4u5b5OlRfLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu5MilrW+thiZSUxoRJK+BpEqQL5fWD2JRDBKntwCK+4ADTVYQ
	7Lvmg838+QTQiu/MYXelnFyX1QYMXQF4BLbFuPzlbk1s3VnroR1OTe4ZLnepe+9/bvJGbgRzwey
	MRUuoZPLeQLRGHfDw9zQIe60Sgu++d3IaIOlpKD4v
X-Gm-Gg: AZuq6aJYOC8Po6D2P+d5DSl5RXCx5+lyrj8vlxFa8fOWq/vqjMuBjCxW/sGPCtoPIBY
	mR+ZqMLm0XA9Dnoxt6SyidxGgfblOBn3ZL84Wbx3qjL7Yt4DzOFmw96lYgoUam3Js035Go2fVyC
	HsnJE8voeHhM+THrh2WEyxsXM+SEUqtRAKUhqaPhNaxYEa8pSjSUyrNFRbnrT7JUMOdJ6C3TS9L
	gceJ+gEHlGGmf3HnzdfhQPIOVP90yj6aCZjwbuGpNm19SEg/OBeymk1Ss8ajHJamzOjhQ==
X-Received: by 2002:a05:622a:130f:b0:502:e3c8:2e25 with SMTP id
 d75a77b69052e-506399c903emr47797061cf.76.1770397785036; Fri, 06 Feb 2026
 09:09:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203175422.4620-1-fmancera@suse.de> <CANn89i+UUWx5OhPnJnDhiCfr53BPTAGedBucgqYwyfqkidf_Cg@mail.gmail.com>
 <8d94faf9-2fb6-483d-9767-bd665c4a4b9a@suse.de> <1649583d-71c2-425e-a2df-685d5f6dc67d@suse.de>
In-Reply-To: <1649583d-71c2-425e-a2df-685d5f6dc67d@suse.de>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 6 Feb 2026 18:09:32 +0100
X-Gm-Features: AZwV_Qidxz5uIrMnB8dhKLOScV5vhsNf8LrEzY_iHNMnqdoi8vLbqK75xYPLiXo
Message-ID: <CANn89iK3Pu2NXxejTSLF-7MhBc03_ZJUjOtZcTC4nMsbsDpbSw@mail.gmail.com>
Subject: Re: [PATCH RFC net-next] inet: add ip_retry_random_port sysctl to
 reduce sequential port retries
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, ncardwell@google.com, 
	kuniyu@google.com, dsahern@kernel.org, idosch@nvidia.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thorsten Toepper <thorsten.toepper@sap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 5:28=E2=80=AFPM Fernando Fernandez Mancera
<fmancera@suse.de> wrote:
>
>
>
> It makes sense. I have tested this approach and we got a more even
> distribution of source ports when having thousands of reserved ports. No
> difference at all when not using reserved ports.
>
> Please, you can find the distribution graph with the current algorithm
> [1] and with the random step algorithm [2].
>
> While I understand that this approach is introducing a call to
> get_random_u32_below() on every connect, I am wondering if it makes
> sense to replace the existing algorithm with this variant. What do you
> think?

I would ask RFC 6056 experts like Fernando Gont what they think.

Note that if we use random at each connect(), we defeat one of the principl=
es
of ephemeral port selection : try very hard to avoid 4-tuple collision.

>
> Please, notice the implementation below. I plan to send an official v1
> once net-next is open. In addition, I am rewriting the commit message as
> I find the current one confusing.
>
> [1] https://0xffsoftware.com/port_graph_current_alg.html
>
> [2] https://0xffsoftware.com/port_graph_random_step_alg.html
