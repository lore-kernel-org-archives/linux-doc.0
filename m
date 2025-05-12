Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009C7257442
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037455; cv=none; b=Ax6U5zhtONc3/+vG3pi6ZR2wtnhYPqVniXwfSfsF84nD7uilDRNnsHMJdAI/K7fo7YvbK5fEbysEtn/BB0e6ncH89msUp0NEBsKKJxaiWYgn9s8+2KotA0GdezvVS8uPB/vfGV8avFQyunXs2C281otZlv6vVV9S5Il3/SrSCug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037455; c=relaxed/simple;
	bh=BOP6Uw6zm7kXZhT9LMuJCWcMldNLHWkHgkN3+glNCvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu3kWeGb7sqpsQ0mVi6wyl36VdUNG8RET+yonbmK4PkEtmh/Ch8Yp5BRiwjJ8v1VDxw59BKwLKPx2E8wRPI2DdlnZFEYmweGWArefzGfJwecpA2wX9duoSMR0VxuFJ60l+Rqs93udU3+6jj5Y09sqz/YnxMg+T19t3pOR/ISFJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=QuDg+Yb4; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="QuDg+Yb4"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47662449055so22648521cf.1
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747037451; x=1747642251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BOP6Uw6zm7kXZhT9LMuJCWcMldNLHWkHgkN3+glNCvs=;
        b=QuDg+Yb4FoyhWZ7CnOsbbrw77oYDZczjXNHd4CPBAR899TYUPVigb8cMBnwHxItjdM
         c0Zkpa3CBi3NVC3qQifXIdqVuNk+p//XpFEaIIG/Y5RnUL+M5BwsVUf2CkDXflr968GV
         70EpHTuFgURd3CGYTtkY1cATZs9tVXOhOCiKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747037451; x=1747642251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOP6Uw6zm7kXZhT9LMuJCWcMldNLHWkHgkN3+glNCvs=;
        b=wfm/CgSk4ytxeuSqQHk7SNb5+YF/4CPvXB1JuoP+xPrd1m46OQQfOVMnqJGL7uQHf/
         0hBVP+PfZwPcD1Zisn7hvl9kJWBoEOADqYGC5w+u9D4ppH2CbAgJTrZ56N8cIPr825Jw
         HpYKRN6N5RBTmDMktzUQ4HzBEaq258zHlwarXlxVmjc6fEDgPOIXUZggv+y0abORlIGg
         b6DFdUzmkGpC0ctKEVmR5jj1K6qQhk1I3iyuar5DmELeT2jRBN7ycUyDnM9FXsQXpRnh
         QgcCSrVmxlhXiUg68CPQtHK5jEHIz5SI8CkL6/NY54WXqhe1MlWR3+nf277ixxQjyN5a
         2KEw==
X-Forwarded-Encrypted: i=1; AJvYcCUGXZAIvt2F6o0u2H/Ui8i2GKfsGZufSUlM1MpeCBBJpci2F3xSKDxTWpteoqtJCzKp0QA+4y9JzSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF6rDGSTY/pghFdxb7WdM1p1ZIPeVR9QdS/UFgesYqMUXB59ib
	dWPT87p03MkQ60barRsx/cPbs9Shwj4ejzD61o2RLTMByuJ1DRDPQiWojTKYPDv2717WyFYHs+p
	Q3AMF/0lhyswUQDTnhtqcolBPQrwGwZ2W0qocvQ==
X-Gm-Gg: ASbGnctmLI0rId/5YFrRwR3xEFI4dUFh3O3CZIV/cmD6Z8p+2R8dpUiyKpr4gwXSwGh
	BUH9FFW3kBBl9y3yagT/rXQsp++rxQFABtgz/Uff4pCeCKCGVvqfjCDo7qYWLRipXk2AFQSjFi3
	5j3YAkabRd+JKw3A06Py7LlC45xRi0F9JGDr8HbNMJClZZfA==
X-Google-Smtp-Source: AGHT+IE9riVAa+kf1k7H/s/DMg0+dtkLLuYpL/QwjZJPyX/AyxDSXkoHgrrw6V5TpkgnV8ryhPngQ9J6/WtkR8aF34o=
X-Received: by 2002:a05:622a:30c:b0:48a:e2ec:a3b4 with SMTP id
 d75a77b69052e-49452744396mr167098991cf.17.1747037450856; Mon, 12 May 2025
 01:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-fuse-passthrough-doc-v2-0-ae7c0dd8bba6@uniontech.com>
In-Reply-To: <20250507-fuse-passthrough-doc-v2-0-ae7c0dd8bba6@uniontech.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 12 May 2025 10:10:40 +0200
X-Gm-Features: AX0GCFtoLXIKOqkBSTvl2qMeCrxjYdfhogIog4A5r7OHYgoDzEDxfLUMnrE1sJo
Message-ID: <CAJfpegt46sKDJfB0V=1Db43VjoZQ-nxHuCVQU_k-A_AgxqnPVw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a documentation for FUSE passthrough
To: chenlinxuan@uniontech.com
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bernd.schubert@fastmail.fm>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 10:42, Chen Linxuan via B4 Relay
<devnull+chenlinxuan.uniontech.com@kernel.org> wrote:
>
> This series adds a new file,
> Documentation/filesystems/fuse-passthrough.rst, which documents why
> FUSE passthrough functionality requires CAP_SYS_ADMIN capabilities.
>
> The series also updates the MAINTAINERS file to ensure
> scripts/get_maintainer.pl works correctly with FUSE documentation.
>
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>

Applied, thanks.

Miklos
