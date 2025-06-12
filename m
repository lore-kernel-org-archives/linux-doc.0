Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587AA1E25F2
	for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 06:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749709373; cv=none; b=C91h2HO4UIrpKGLIbWJsTqeRV6bMadrgPSKT+6noK2gmOg3tKyO2BOW8O3xLVjE0xQhWaaW8MrYjXxCjWJUhZL4qGgtcSMfjeIW38J7PBwquh+wuvCvSypkS8jgEXIU6iPmlSWRZkUGqYqe1CPK3DKdA3fVm64jDI/xQdqUlUps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749709373; c=relaxed/simple;
	bh=NVSA+aFvs1XO3TlVQr3XMhBpHu6vTAXKDoH9mbxB4wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4RRLBnv/65cED6SmTPT8CViPZkTqqSW1aF65/g0ZRJ0DRVRRPJHa2zgLbDF33b6CqFNpRHrQ/pnXDEO16+Ot1ylvMZr25VrLFyHvguzT1GhLJg6Lox5rbjSKO89y43WOO8rX+U8POpXS/0vVFQ68xNwi5XONw0FPydYkxiYQaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=oGxaZFuG; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="oGxaZFuG"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so7791591cf.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Jun 2025 23:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1749709371; x=1750314171; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NVSA+aFvs1XO3TlVQr3XMhBpHu6vTAXKDoH9mbxB4wc=;
        b=oGxaZFuGzg2ustNbGNKVleQsTCAYnk7VpaJ0pBE0Gu8xGCkdCeklfkUPIOh2gENeiw
         x2L8jpg4makVjVhiLxNf7ijMxO2AdHtxQR/B9h40D+xj6j2lq0MaHkz2MPJTT2JsnnVP
         mPVl1APKyY2GvXrRK2KTlcBFkougfQYVw1Z7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749709371; x=1750314171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVSA+aFvs1XO3TlVQr3XMhBpHu6vTAXKDoH9mbxB4wc=;
        b=ldk8OyMwZRv4JbuXeJ6rx4kq1KxkUCL/Xd+nV9L3S2r67YRctFQHmKE7RwZZLiqJe9
         N95dlQvdXNu50zwb3ooGv4XYxXgk3n0bqiD1Z5nX0oNXS63yKSGnJUWbXacJhd5YrGAk
         uSEGineAxnPo3SLuwsGEYW2yrt/pyNcimTAh39lLWc7UoRJlZTSaFtNfCw8YE1T8DII/
         AKSCUu1Z4tnOBMpgfD0PJl+O3T5jTonbBEmSKbM5iEyRtJ4KelYm4iEcUvOBkRDj2sPg
         s/5gx31C4dE2WQ9HEn1ZdemPekNgUCRF8YyKIpZTxxMjL0kFqD//KM8hfw9ZAnsr4hQl
         G4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUbtqk7f1U05gCm56xmpUsFeKYzoYE/HffCN+RMhe0X17Hmlh2xM3I3JmagGwkSvSBL1z7ccF98oCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Qe8YO9/E1w3WsH4AUrdS1Xw4o9lkZf3aPpCeQbzC6yoDqbvT
	EFu+C+rwEBoEHbLehPjDo96+8hi/fDYCVCp0dMue18MDL6PmlP09i0i4Bp3SVZ1ydnwKpjsoU/e
	in/lkeuwbPvjZtc3K5vu79KQlzVmezhwbgxDXB7FWcA==
X-Gm-Gg: ASbGncvLp3ha4MgKZFZ4/wWkTnADvx1b2JrdkgyO4NM0FKSZY/wOUJUnEXKG65xitWU
	46YSIp0nHz19bDGK2pdlkjRSFESaLcn+dpIf+YdQ7iZDWCxS+LkY6kdv5VYtFbnlBwneC/CGyxr
	cJFIY8UKseVSWQRZ+mo8QHPMgrquc5K58MFzcx+h4XmEvq
X-Google-Smtp-Source: AGHT+IH2I+YwhsNEN2W/f0jBkF1nxvsiE/H4QK8q+uPATGIvdhpGf8PYgM3jx5R7mR9gdQG0BY/Jl8TKR1yRM88Z5FA=
X-Received: by 2002:a05:622a:1e10:b0:494:5805:c2b9 with SMTP id
 d75a77b69052e-4a72298b30fmr46608091cf.31.1749709371314; Wed, 11 Jun 2025
 23:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610021124.2800951-2-chenlinxuan@uniontech.com>
In-Reply-To: <20250610021124.2800951-2-chenlinxuan@uniontech.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 12 Jun 2025 08:22:38 +0200
X-Gm-Features: AX0GCFtg9rZdO_j-xlB7BjFTfd7v-suiRWlCa3w6oicMUUxJvtRI76Y9_mraJcE
Message-ID: <CAJfpegtF0KUw86m_NHFGUtnfcmPgzO88hv3AOs14=j_OQYuvbQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] doc: fuse: Add max_background and congestion_threshold
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Jonathan Corbet <corbet@lwn.net>, zhanjun@uniontech.com, niecheng1@uniontech.com, 
	Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 04:11, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
>
> As I preparing patches adding selftests for fusectl,
> I notice that documentation of max_background and congestion_threshold
> is missing.
>
> This patch add some descriptions about these two files.
>
> Cc: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>

Applied, thanks.

Miklos
