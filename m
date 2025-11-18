Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7329E0E7
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763494321; cv=none; b=BkIvfSSqiOZxX6g9UoXefgQbWIND6KuwMJm7MZNjwiATLU8iQ/oVoorSN4UHvUt2lYIj2gtnzFW4bNzMvUg/js8H4rKA/lE5JnDZjOqjuvWtKesDrF1vH9vqtroHAqaEvBBIhCX7ScTboWrqMMYhBubKtFD/unXAC3d3+C5h2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763494321; c=relaxed/simple;
	bh=RYaqzEIQYjC/AA8fKfHRWLmVY/sXnNn+7WATr1cqH64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KoLSsQLvraOqZTEnotFnitqNmirT7TLAMCTgBXYXlsU+fGxsi5DDqBchhWOfUUiOCuQx6SByaqgLM06EMs8f13pDiMZQfPLuEoaBWuBKjGhYc+ZAidooaN5gJ5b1dUw0hhi162K7U6SHlWY6r/AuiypzecVHlWAnb1xwOCtXL6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=am75plmu; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="am75plmu"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b75c7cb722aso182468966b.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 11:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763494318; x=1764099118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYaqzEIQYjC/AA8fKfHRWLmVY/sXnNn+7WATr1cqH64=;
        b=am75plmuQWqaoMVVxSSFawR/0Enf59eLxMKJF2WuTzg1GxdIsi5MmiM2IrE3c/OjuV
         vArx+DVUex7GiWY1OVxM0lPbzNq2VGwxvGmqmJFDsrMOIfkPl8kkmwWAgwibkWaDJC8p
         yUr2haCUXDJxA2q4HzJTh+2BxiA1gMtdfD69Z1gDGuVBKmxYPzVJyTBUIoAVrCplahvN
         bgyCIyzAP3R/PVNSAfNm87kXmUk0yr8c1ykYHq67aQ0QpBCad+dR+h6nQWtfddHjdkwk
         tX/EOrlS9X8WRmfsSj++ykQmw9jHDYVe+3yIi7jQ0gLJraWR72L3gSaAmu54boixeJTr
         m1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763494318; x=1764099118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RYaqzEIQYjC/AA8fKfHRWLmVY/sXnNn+7WATr1cqH64=;
        b=QypAIszTGw5EW/Lp7OHGvJUePuAHgjgorIkfahzr1VcdgIxtYq3NMNh2oA5cTyrO1i
         TevqGcoXJQScmAG8YqMSAiFsuSdhJzJMECSu/Ft1LmlQsQDz/aRBRI4umWGxjZq00h+K
         QZT+hBhViloo3Q7f65j+82bbOttvwf18qXo6oXx6tzGMZhgZpmnYJpwAncPHd1cP+cEw
         oGZCxG3HbkkXUZyKCT+PJJ6GFP04PGCtL8R7u8fuq1IbF714pfyYBwDgjF+GhPR2Nv49
         v/MJyY58BATMD042s2JbLQ9WT/ZTFGBjmKOxk/uNqyi5WCIMQwiXgr0GWo1OdNF67m3x
         6MPA==
X-Forwarded-Encrypted: i=1; AJvYcCX84eOf284AZTGcRy+QICWMexdhO02g6KPEjGTEmIjHZO4UxNB75soVOVdQ4jVDWnUfFRpUZR1j+VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBXjJjlY8uuTARyulzj04hSeHbeqkY1pGvr97BVB5LkVVnk20u
	34Ir0CTSMcQB9oJUUDvCSgxiiHnC3fH8iD8/Zvc6r2wPHS5WWLO/Fmp9qg6lSlJMdVSevS+IevA
	klPKoPNSWI+8Q/4TnbaO+JtZWeSzJsELz5IgqN6aXsw==
X-Gm-Gg: ASbGncuQshncAAxcYi2GgnAlw4SZZiRrtDzwhizi+ZQLhwkjzs2XXwn3GNHYaitva7C
	g/HPGos47KSwKm03Ntiwan74p5hLnnD5Gj86kW38S/wGAar75hfd2dXgpu4oC3X0UEpNoSyXES4
	DPDLjOUl1zWEePqYL8L7Dm30kQaJGT4KBLuE7gx+NQdzY5xDVSnsH0SFRw50qLR0sAQkhIIpHhg
	BfO/wZO097L9AvOs0R+1ACxDlFpfXBbW3l3HdJ7T53lWWnxuxj8psFTNWMl2GROsniEH9NDNYKm
	C9o=
X-Google-Smtp-Source: AGHT+IEoY5GxNNnNMoAylXF6Jyy2pRfpo8iGqzyCOOpRdKPPNoDFYT4pwtFBZN3XqQWL9L3hx4nbDu6IprbOG+APsaM=
X-Received: by 2002:a17:907:7b83:b0:b73:54b6:f892 with SMTP id
 a640c23a62f3a-b73677edcbfmr1719343266b.4.1763494318109; Tue, 18 Nov 2025
 11:31:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-7-pasha.tatashin@soleen.com> <aRyvG308oNRVzuN7@google.com>
 <mafs05xb744pb.fsf@kernel.org> <CA+CK2bAqisSdZ7gSBd7=hGd1VbLHX5WXfBazR=rO8BOVCRx3pg@mail.gmail.com>
 <20251118190901.GS10864@nvidia.com>
In-Reply-To: <20251118190901.GS10864@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 18 Nov 2025 14:31:20 -0500
X-Gm-Features: AWmQ_bmbBbBA2popU7vHmJW9PAVFFPXLJPyntHOLQd2MbOo1GozNXCODJ9I9W2Y
Message-ID: <CA+CK2bBXRopZBBJi3YgN_PCwe2b98O=0oyu+XjUkfVrffrDVTw@mail.gmail.com>
Subject: Re: [PATCH v6 06/20] liveupdate: luo_file: implement file systems callbacks
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, David Matlack <dmatlack@google.com>, jasonmiu@google.com, 
	graf@amazon.com, rppt@kernel.org, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, parav@nvidia.com, leonro@nvidia.com, witu@nvidia.com, 
	hughd@google.com, skhawaja@google.com, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 2:09=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Tue, Nov 18, 2025 at 12:58:20PM -0500, Pasha Tatashin wrote:
> > I actually had full unregister functionality in v4 and earlier, but I
> > dropped it from this series to minimize the footprint and get the core
> > infrastructure landed first.
>
> I don't think this will make sense, there are enough error paths we
> can't have registers without unregisters to unwind them.

I will add them back in LUOv7.

>
> Jason
