Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E315413775A
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 18:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713293587; cv=none; b=mU6/JW9K+PkVUN+PhJh30yRphWS5357FJZNu6EQdpBmLe184xQd5vx9C3AX+lJabOx3SiWXM2s3O5oyX2NABWypauODs9l4nvjhnlNHoMdVo2/AMbq03ldLZI5NBsZwbTqTjHc+HGMEsNFuxmWtBwYLYI1mWVQhh6QR+jUW1/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713293587; c=relaxed/simple;
	bh=wJGknp5lUHANdPGAPLPnVm4IhArPwW8Lmavxx3DEeCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtnkPpCN2BsLjey9Wqk1gE9a5z+h7AMjEgCtTZHwwQg8GzyWnZpr2fUDW3jD+XLjly9rdzi0mtZ3isNmohbVjK5qVMTIVR99TIsApO6MBB/9CgHrsu7Dhw87n3ZSghmK9t9KyyuLssc3+/Q7joobOY5p800cKEOJguMsZQn0K+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pqdszqc4; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pqdszqc4"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-36aff988d73so19865ab.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713293585; x=1713898385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tICw/qDwa1/FY+SKomp4c5dR3Tm8JBis2SFpQlX51nM=;
        b=Pqdszqc4osD0CidaqAoTKC4OlSpg50X5RmnVR5oypvL8N44UErrFiksxgyWTHLMEua
         CkBGdKX63vQ0aoG/voE/LsTVUjF7j76KPOx8V62F/xL0hjq2dunEnwmvQslCPHQd2o+3
         LlqA/PZwaSz7PJk60+Q9ZuQ/zHnMY7mMTE4sBT1QPGKKxuIzD6MQqDGB4Ce1aXw5NCCQ
         3VRBjWQMTEx5KFqDANIYF6YfCkCOdihnG4LDf5mp8RMNzjznLySao03iAOYAxc2RkwDo
         5ZJrPfwIfHRAMX/gIP9gvBFDGi5lYTLTep9ZGBrzvoYJe8c8meQKAnKqsAg0VvnVYlIl
         MJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293585; x=1713898385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tICw/qDwa1/FY+SKomp4c5dR3Tm8JBis2SFpQlX51nM=;
        b=nxvYEWgezXTzDEa139BvFs4tw62moOmSLl43X3EiZajvdbPtta1cf249YftH9Ng/Ty
         HDPoOTSCKEAwThXL4c3XAeIhpEKSZn3An+BegKW3KWBs+sfS0EM+XlOSgC6M6h1R+e2A
         2yLzG8Snyi7d9MH2hyPu8A5meH2QNrDhW4kEqWON/t0IvscehHOr/3jLl4TZ9qrJeYy4
         GApXoYyOYBXJD9hMA7cS76VApRA+IYHLSCUOcgP1te1SJ4OCrUb8X+UPNS97DsroRzpe
         YM5DIjTZOlruYCxjOK3S9bXyBuSV+btUfQScL504U3xaEHF9tCUxaZoP24l8WzVS7bFk
         1Cgw==
X-Forwarded-Encrypted: i=1; AJvYcCUCRkZDl8lRNBMgVM4aX8Ctp1Cxbgsp73vAxZ4GK2FhNXrT7KtfKBNo9eN2sKHJEWqEu7GkDHF7NnCqgG56KlBZo3hcUB323RGp
X-Gm-Message-State: AOJu0Yx7uih2xfE63LK6n3Yk3AbwpWNp4KEGh2vSPQLCilnlUv0G9kOv
	Xv3UdvAle7lRtRG5x7X8z0TYfnbgdpxj9xLxUME1X6bcV3LmJs36C9dfmaZyfW3rNnTTdgUBNWg
	e0X1xCVYgRxGQ8vcT9VVkG67M/WImZJif7f2Z
X-Google-Smtp-Source: AGHT+IEL7EsPgyMdJjpjdlxNt7KIfzB/hOQUcGyXLmnPNXR7c20O7iK0IwGaFMb/Z8k6DNKtI+0c1SJjI7Hx0PC+IWI=
X-Received: by 2002:a92:d68a:0:b0:36a:26bc:5f45 with SMTP id
 p10-20020a92d68a000000b0036a26bc5f45mr30552iln.14.1713293584942; Tue, 16 Apr
 2024 11:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1711674410.git.babu.moger@amd.com> <1a6bc747da259e8b3a85de339bc1d6bf94995c53.1711674410.git.babu.moger@amd.com>
In-Reply-To: <1a6bc747da259e8b3a85de339bc1d6bf94995c53.1711674410.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Tue, 16 Apr 2024 11:52:53 -0700
Message-ID: <CALPaoCj_yb_muT78jFQ5gL0wkifohSAVwxMDTm2FX_2YVpANdw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/17] x86/resctrl: Introduce assign state for the
 mon group
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, fenghua.yu@intel.com, reinette.chatre@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Thu, Mar 28, 2024 at 6:08=E2=80=AFPM Babu Moger <babu.moger@amd.com> wro=
te:
>
> +/*
> + * monitor group's state when ABMC is supported
> + */
> +#define ASSIGN_NONE                    0
> +#define ASSIGN_TOTAL                   BIT(0)
> +#define ASSIGN_LOCAL                   BIT(1)

We already have an enumeration for the monitoring events (i.e.,
QOS_L3_MBM_TOTAL_EVENT_ID), which should already be suitable for
maintaining a bitmap of which events have assigned monitors.

-Peter
