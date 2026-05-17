Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7730232D43C
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 22:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779058398; cv=pass; b=leohhbB1vDZN1+6RuH/vXMVtrRzgYmggyj7dapTIl6AqHZbxw1OLZW84N1sJXiyl1He3Fk4DqggekU0zXMtXDe6ymD2QTqChkTNGOcUdvQmDfBlztn2HdsFoeNz15eD40HoRh23xAOrAw+GzyzgatiIC35nl9cCWAuM/P+Q37Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779058398; c=relaxed/simple;
	bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVHiBoLzZ9Hskf97UcT+7FwLEFYDsj9YVKeqFgZpQ9fRlTnLVxU1GQ2UOG9K6oPROIKYH88CqXeLZfD1Aamxnq5yMWmfhJ1YPWiRmcpeFIjP6kjOLur8wsyuxYT2RW7aicl7kmtHvNdJvPyKObYyInC08XT458sufw587iMAqP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwabBkpr; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwabBkpr"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1351aa6418cso88623c88.2
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 15:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779058396; cv=none;
        d=google.com; s=arc-20240605;
        b=TlUQSo7KOMT19cettBo2a7S87lSOQXTt/jzqKl6ormtZzg7XjUmCeJErFtuBslCKQU
         LRRvY/FEAUbCzXjbmcXl0vpt9J5lB0ygNHTBU/4TGnj30WTRR1tTEn7IsKawbDYEZ7yv
         nu9FlkcaJ/XloUq/S8R8Ifi/zuFLcB7CbQ+2Rv8koUy+tBr9fD6het7Kj/QC1QBUAG7B
         YP/D4QtZqGgzfS7LFgSsU+mO3uR4OqVljpOu4DTu2xfML/CjzSDSn/TLb9VzAa8aSSvJ
         jDS1HMVHAG0JjxG9oNDgQQslFuJmWejP9kWPai0WQyDCCw/P+n6Z6Ev+AZimn3ue0d7H
         f7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
        fh=fqc2JAIlFETog/RZTF9KKO0aNjMNCJzPinuE+5hlw8k=;
        b=iEVF7VOzY+0Un6Qf15ruzw3Kg1eMytYqHfrJkDkL/ljmMnivCe8fv4u7cuUkCGgH4A
         07jabibhnAaDDezsg7U5gSw7TW8FO0sktpr4Ze/8LQSVZQajzfknVw+x4HR/tPOvnyFw
         Um3n3JB668bLeeaT0uI+QMllgh/Qein+uv6/wK/LUSp82Ck4wzASd+sd+sdv0+5ob62v
         j2jCY3nfZR1PP6fiY+JT/6GskgF9gLbXc5Iy77xvXH7WRek3RFOwZlCP+B06qFymZlXg
         kp8OAKBTdAiNwbnctcOcIIU3rx12T50gJgYhA2LLImUoQFZIG11Y0W3GyDbC1vrUrKZ9
         HY5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779058396; x=1779663196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
        b=iwabBkpryb/tiBEc7gMiyMUXR7SMEltMlOWzBrIyXb4oN2UYBIhbDQzQswYwjPAuPm
         9WeeHJaJ1EElkDQKBgIe3aaOX+DHWKeU3YPUN2jNpsOW9SEAr2ewQ9DvwmEbnLck4Y/0
         o/uf128KMpUHIxl6tz4S7DLPlzrEyvQveSVONv/HKMdJ424Rn/cAAKUJp/FB8Jale6Tx
         QVDyNUnPNy+/EGl9iDFKd+s7T32L5Rk/7EFp2dBUjZb6L5S5gX4/XF5TXSGxcFxqL4GI
         F03R0NZ0ieZaZqntjJOIuya7GdrnHnQkTixsmivOmqzTCEmkRQrp5b2LtgiBX+SOsQ6w
         cyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779058396; x=1779663196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
        b=p+pDz2BYVXExLJ1JCl09dTQltfjl9gCKdrWvmSjOliZwDigdSIxAX4ySAo+/qLfdGO
         rkx43tJH19ECW45YbPCszEjHgOoU+RPMW79ZYQSbJxSETeTsXBDMyivCAv2WlNfgqBnY
         pBns5TJI9dScOk1BzXNWWKfzR/kTfAOn/xsHZvF98Hh+9dfk2abOj6Pwdtur2VAA8IUk
         c85FPtDI4RYcGOzX1oGdkJEgB5sw+xgBpXS6YnNmavKUJHGqRc00MRxGocxNtDGDHyzM
         S90cuFfvZ//X+E9vrPhSvyDutyRWcGEqSj/56zD5NxvhgQzuMLjy4bXxB0woCD5b04eH
         /iVw==
X-Forwarded-Encrypted: i=1; AFNElJ9rjwRCFY0rCFHiwYIEi72X7DosNfCkIeaHDNYIHAde7+KlG2v5JPjWEdFEkvLl30tMYSNAoFQ/M+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR/Ntiin+CJnQLugN2utfbGVqzVDD9OdO2niJ/RPuSZeg8vtgS
	oUqpr34+KqsR9O55YZK3RSDkmRr3QnDNJXsrg4qpJFVu/f1qn7HRKpzmgYnhrKx0TxuAhuPZoxL
	sEInZedU4AO7HKpRw7bwXV5KyO04mz3E=
X-Gm-Gg: Acq92OHIimZbHB1CV/tS3JVQOxp2+0r/hfPN43JLgZk9yMoxdlph/qrSC2Qzsa5k0lq
	KoQ19gwZuDtFrcKaM3C54ZeA0nGcaqH3N+9iCsPcOksCIesAqnxn/HIqd5vpvfcA7c3PDOIzwCg
	/DmqyaPXtWdXlWYJIt+YBofUZMVYAUSuOSpu5nerPAr4bhYK0IMl/IntVyXOjTLvBR5zElfKDDi
	wiqnEg2v5oxOAIcqHCZuEHFTsKMOicspQA5F4DFU4QSr4c0RAxRETv0m2/7OTdXnbnL+hlo6467
	162NfB99j2pnIbaX8OJgdRIB0JFJVx6JLs1UiJ3y0saoGN8sQTPxAfPAdVv4SRx+IZTxL3LRTpY
	a0h1RoM9oqUSxzvdeMBKeucg=
X-Received: by 2002:a05:7300:dc14:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-30397b88952mr2469266eec.0.1779058396471; Sun, 17 May 2026
 15:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
 <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com> <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
In-Reply-To: <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 May 2026 00:53:03 +0200
X-Gm-Features: AVHnY4KBxDsmrWmWB1r_5d-YCkKw_SSUFyDdSueLkpNJn3Kc6QzpiTKf-tfUDfI
Message-ID: <CANiq72mGTehUWS2-MgukOKmwAn3fB63boFNqbNENse6B00M7Zg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 10:25=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> I was hoping for Linux to avoid the Rust trend of downloading tons
> of third-party crates, with all the supply-chain risks that entails.

I completely agree -- it is why I said a well-known, vetted set of crates.

That is, we should decide on e.g. a single CLI arg parser, a single
logger, etc. for most of our tools, and ideally they should be
well-known crates (ideally already trusted via use in the compiler
itself).

Moreover, they should be pinned with `--locked` or similar (like we
already recommend for `bindgen-cli`), so that we only ever use
something that matches the hash in the lockfile that would be
committed in the tree.

Cheers,
Miguel
