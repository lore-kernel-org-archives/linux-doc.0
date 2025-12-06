Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006AE24B28
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 00:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764982396; cv=none; b=Wopd4u7DL5yYvnaMQ9y3ZtecGADJrCXu8+zXhzTXP8JaNdzkmOzPhtbAJOuig/JOXOgvogCv5M5fWDsG86sKr0ARM5wDMd2kKocBa9IAA+sk/MQS0dLssJpcE+nI1v7QGfs+eeD/iAT3mUwy0Mb2AHaHcPUy/3DSt8OiQ8v1qYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764982396; c=relaxed/simple;
	bh=cKtmfFbUhBUM0XhlVIStvXoA29hWpMzNrKkie/ngmOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFJubBz5P/Jz3MpvL4sg+G3SLe4VXnV0J9HetxcvOdAobDg5tyBrA/KJIf3vA+p/sSPgm+PQn5uBtmZgiowxh96k+QYTgHszNdSMR3alaOsGy+jDP6U1Q+P8if5lRWVT7fXACHxu4riEmS6KUztyJQeMuhpw98THjccmKzDGWE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Drln7UjR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Drln7UjR"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so4298241a12.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 16:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764982393; x=1765587193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fIrOdDlCGZu/lztk1/HILGvvd8JmSOyKKUcmybVxe6E=;
        b=Drln7UjRMeteL0iWk7JS8XBC8n0oioybHAX9DKdWHrsaBMGPKO53dS5cq5Kj55vd28
         7wrcAgkq7PxBEgxRcFvP8aJv9dFyN60wkYWZNQ8u0PEJEjS+mQ7nl3E5D9JO8vCEQHyn
         YSLd54enYZdGCVqyevqLLjq2uGBRSFfc2UrMltTiwTvfj19gCp9vWR3eQ/PtXmEdRhHs
         mAakcWGkXOz3tHg4OZVwE+xQS4SseJ6sxlmvnVUfwZzVRU/txX31oUngKTeid68dGt+o
         I4QRefmLnA+cQlcb1WaakuehCwmvyXJoDSlX0LjEzEbrNf16zXhQgofaNOIedrjY02zO
         KlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764982393; x=1765587193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIrOdDlCGZu/lztk1/HILGvvd8JmSOyKKUcmybVxe6E=;
        b=DJEew+ZWzRIro9Q16CE5UQSGTaGLwjFe1D204uN46ig4Acfm/WW4aFQ5Csfd511SX+
         CuT2uuaOlBtC8Bmbdcnfe2Az7N7/c1X2L7kN7TbAJ461in+LuoLzb/0DRq744Na1POi/
         Hb704n6Ltuvu9+wsYKSrFBwHK4e8DJJbC3+hdLG6p4F25bp0P/Smwzt8ddyfPM9/I94R
         V3tmHy9+BTTRM2BQ2FrGqcT8bpyJirSE5NFHE90+uo/OEeg+KPDbvVbz0hZ2WXfmy2Ij
         2C4waWMsZgD/xTq7VaYq2Tdk/MS2qNf//uzIe34LF2QKky72ozDX1ATA1kJLg6k/80rI
         w+EA==
X-Forwarded-Encrypted: i=1; AJvYcCXnT1jX55N5hAvEvVrDrAuTwCLBHXdMYctc8XHXVu/eNs0aL/nXC5gOjSR3N7Aasis4Ll3KXmPu9hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB336JHxTyzZscJ9DCw8KYjM7fzZHKSRWcNZvVNR4rjp16njFZ
	vFhN2/Zasl9diAXYPhlCs8W8qyk3E6gDUuHHpXn1hDSycUrCTtJVz1FQG1iIOE06wpbtQUs52Ph
	dW4Cbg1RXtj6yPB5mGzZsgRVFb7nby/+WKptAN6+4PQ==
X-Gm-Gg: ASbGncuyxURfoomDhG1lSwqzuMDSd8U0+UQyWa4fjsu0t6qKIosWaQ5D7F+MTkE2sWo
	A9WIhsTx1yP+WtPNbfCRsFiHLymdOvpXUjXuZTL2XZodUvNYe4SvK+ovFsVAlwiUGl4MJHLKW17
	LxsWnTZ2Cg288n60SQi+LME/kS9qtATfWGTh6r4C3XaLkiEl6kMWIfeiFcZmbcVOy2pY+Bc5b/L
	ZnwlASB5UxFH7zBYCbvlKroFq1upHib9EuPgvufV78sADO50LZXKvRPmy8uI/SgQCloMv55JOKI
	FXIBbfZV
X-Google-Smtp-Source: AGHT+IFHosF6g0fHDigDciUIsP429d03O/Tjo8s+nSOHgJNz6A8Jdt66K5NVBdAAbcQr3mU9lKJtlEUo4CJwn87Z/DM=
X-Received: by 2002:a05:6402:510a:b0:643:130c:eb6 with SMTP id
 4fb4d7f45d1cf-6491a432570mr597680a12.22.1764982393304; Fri, 05 Dec 2025
 16:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
 <20251126111924.1533590ce355b92d5306a0ec@linux-foundation.org> <CA+CK2bCUBMgnepMzO21+SH6rY7bb2OgRqxkLkUr33UsrPoe_2A@mail.gmail.com>
In-Reply-To: <CA+CK2bCUBMgnepMzO21+SH6rY7bb2OgRqxkLkUr33UsrPoe_2A@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 5 Dec 2025 16:52:32 -0800
X-Gm-Features: AQt7F2o9LtvfQ4UfBaTzyxDk70MJLBZc1QgyornvTnYq8uTMulLDsYM803Da4nQ
Message-ID: <CA+CK2bDyd9jkuD+aBEaSTqw_mAXyvV9b8pa-z6eDvEByQ4oTiw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] list: add primitives for private list manipulations
To: Andrew Morton <akpm@linux-foundation.org>
Cc: corbet@lwn.net, nicolas.frattaroli@collabora.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	davidgow@google.com, pmladek@suse.com, tamird@gmail.com, raemoar63@gmail.com, 
	ebiggers@kernel.org, diego.daniel.professional@gmail.com, rppt@kernel.org, 
	pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"

> > > Adoption: Updates the liveupdate subsystem to use the new generic API,
> > > replacing its local luo_list_for_each_private implementation.
> >
> > Fair enough.  Let's push this into the next -rc cycle, OK?
>

Hi Andrew,

Could you please take this into nonmm-unstable branch, I want to send
a new version of LUO-FLB, and would like change it to use this API as
well.

Thank you,
Pasha
