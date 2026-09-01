Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDD2477E3B
	for <linux-doc@vger.kernel.org>; Tue,  1 Sep 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257015; cv=pass; b=jcC01cgr0WweyatweHt6pzjpG/0WBYFnOHwjIFTRORDTJRrOOp15h5yoH5EsXwuZkL+KMTIYvIkLkZipMQvAIkcE78oU/RsMHTUOXN4f29A04v7NOKfl3Z3Jfbk/I1yE0kCNx+q/fJKpINjF+k2MddivI4wHvD9qaD/GiS3JK0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257015; c=relaxed/simple;
	bh=dtC2b9rE2+PvqyfvIQpFBFFgI4ZlT+seDQ76UBcyXhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1FeLG0ukfAtwQKbaDNKzj75K9mZqvEnqUldEjfCHuOArknWC1A3W8hfVxLzE5+JPlygcFtobeWOInaqq9RGATM9RxTpW1pZ9maCZAM48GU9rw1SE3sjwD3K6okfwVe+dwHesn9bx7YYX5U+b385DO+DdrOmr2/1cVm4peCEAbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2rRfVrQ; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2rRfVrQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ccae46de39so6628775ad.3
        for <linux-doc@vger.kernel.org>; Tue, 01 Sep 2026 03:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788257012; cv=none;
        d=google.com; s=arc-20260327;
        b=Vx/JoiwCxjcZzy9oRuoSJqxIOQY2GWJpPFoxet5irgQs8cxL+rBERVMeuNPbME6K4W
         /HwR7p/d+Y1IhTL4JND1Xrmc547VPoxE3XZWLWulp9eq8PfRlavdohdmp+yDCVGtm5zj
         v2xFJJykKv/94vLf62MCkBpgjfhTPfXgP5YaNwZBtvH2qyR4vceoz4o4LyXxXm8SAxAe
         KnFCnSzBjCgT0tkQBny8T+EV3Bi/0ZevwDCVTVpOqXXjO5LgnJ/7aGU+n1buwY9py0z+
         Wvl+q3a/uvsio2mNc+tzWk9xJ/G5ISj26LrRAR5oGQJIWXgnBCC/pzbqBAcUKya2qrCI
         IHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        fh=w7BdDOUdwns/d/MqRj4YKzeCTTao5Wbmn+2V+qpUl58=;
        b=MBRMVc/O5Nx+FVO9+HNPE6ohogjcd218vgGZrwtzsoiYfHCZ0v+tV4jk2CKdS0/cAK
         s/ipO/hJ5zeWYamD+4Z2dvIv8O0HC111AQt3QiZ/eGdOzUdZb5vn7oD+qEIzTmCkjgMi
         BhwDnnOvNGbPq45WsG3YeCX4kYNWph7MxwaUpKKyyaaAeoPskBWRTaeX7LzeOwKzrTia
         Sz5ecUpNuiqelMFWYceIIzo1lplSSZ/QlXxfKSOr9E5nERRwweXMpp/xbR9j8Lpf+OCE
         Y9dRp+svkcLrTaeB6uctZ6YjIFg7v2IlMx2qEYutmiD02Qz+RUw06rhNGPisD8JYefsd
         fN+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788257012; x=1788861812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=m2rRfVrQUF+pl/kSam6VyJuJMlKFCpKV113UKvrgRdbCvB+LA8c1VZE60GMGuqVK0d
         Iynnc2jkGkjmV+FADIvZDGIfWpB1e2SqBZEG8A0/PyhgPZ7CUF7+rNci/JpNI/hH9xUX
         ItKTfLWTFEF3CZmK6D6Eb3GH1L2nz/f0j8MtgnYnwFlS9yOvj4Kfd4kDh+IDsJ9IQG9a
         iD4E76b+B1l0G2UyVgguZLJCQ5WwLFaMlhwHwhbBfdWXGKQrtiDudtCOIRET4udMU+Fz
         zIkZS8Vw9HuFOiDEgzzDYq3/UiIFvnq4clS3Yg8ljZgZBq3W4grGnoJZbsSpslzK4Yvg
         rPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257012; x=1788861812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=CnzaDk9IYzew3/ELtdfZs2Z2nu2tkHbVztIj5Guy9sr3q8/0AXLfs/aXWqxQzEXj0U
         EMZXBpl4ggjT8ZY9ONJLJ98M0DkKSWGkwlGsO6VfhaYSGRt8nPU+QJrjFu6lkKkmJgLY
         IuIAZcDHuUcjbEkknm9gn60aHFbvxmi5MxErvfN8JAUIYVopjNI0/ey1xCLmjyKW6Xhu
         mJAUXaqlVNp4hARZkYiVnEhGkZE3uj6IEVYf5duHMr3RujTKuArE5PluG6i+SgRQNr1S
         5UM+eK8zu1Fo30l5WrCGbfjAaXPlQlT9YsJo+JBGjwkZUjFzhSXKw7sikLBTuXPpR1sE
         El8g==
X-Forwarded-Encrypted: i=1; AKwUvBz/X617Vje25aw4Mx1p5dOcLFii/CxdFJKZOGChM2NtRVdpUQF5MnbQLyODomQPZhwCO+gAYMTYqKI=@vger.kernel.org
X-Gm-Message-State: AFuF++mjINr572WFCrqva7t42VHFQ10S/aUeJtwe/oWE4PH8LUJV4xBL
	AjKrfKTmi1DGVz29G7fwnuRZH8fuE8nUgX0bqDUE8X3WkFEBpJEIG8uSAhG3vEYQlqrQQCGbn2K
	MfXr/A7PeyKM5zhL7nz65UTa9DSC/YGU=
X-Gm-Gg: AR+sD11LpVkNxlF+O5atug9jaKqv57taPleSgkPp1wLMsmcs/aAhiQxZNl83HrBUMUG
	AbWNv8IbLmOtL6+k84vqufGw8cTEGKR9C41Fh03vIqjAQT9FgJaDXauMhPb4hmuT1VKJdKb0lLc
	TyhfLzs7FgwMXBUaTyl0PUIz+22mXa4/GrgWVtbVZTzg6+I/sF8oLMeaGJZjWFHao8Zw0emfMlX
	FtwMCKXR+sw2+YFarEXEBxBCqI9qqVnhP1JkXeqHxk4UkG+IkzeDGvXjE5pPoAKchX2lYhTWCq0
	wYjJ1btGjNErfshb7uguE3PStT31RFM7v+7drshl95UyAJnSMIj+sIeWsOCR4/U+pQbt40pDH7y
	IlgSXrD1SHoQ5kutxImgv1lJu9A0FYSM+cWIUAwh98/3613+uO7SwjlDYg40H
X-Received: by 2002:a17:902:d2c7:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d74ce38075mr274123155ad.0.1788257012245; Tue, 01 Sep 2026
 03:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260831151605.638172-2-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 12:03:18 +0200
X-Gm-Features: AcwNN1VbNKqeV_yey9Jhr55AwO_DusZQ-wcQLGmrDCepzJ3Tk4JUYrXX-Z1lHAo
Message-ID: <CANiq72m0xHD1YTADnmQ-fqMPSNHrMGwfPBbT7V4crBgu7B_ecg@mail.gmail.com>
Subject: Re: [PATCH 0/4 v2] Docs: changes.rst: rework
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Pereira <danielmaraboo@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:17=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> ->[v2]
> Ditch the name change [PATCH 1/5 v1]
> Add Acked-by: Randy Dunlap to [PATCH 1/4 v2], [PATCH 2/4 v2]
> Add genisoimage, mtools and syslinux to list [PATCH 2/4 v2]
> Ditch footnotes in favor of a column [PATCH 4/4 v2]
>
> [v1]
>  https://lore.kernel.org/all/20260812120805.1631430-3-manuelebnerli@mailb=
ox.org/

In my usual go-through-the-ML exercise, I noticed that the subjects of
these emails look a bit strange: one is missing the version, the
version is at the end, and they seem to be out of order:

  https://lore.kernel.org/all/20260831151605.638172-2-manuelebnerli@mailbox=
.org/

I would suggest using `-vN` in `git-format-patch` or `b4` to handle
this instead.

In addition, if the changes on a given version are local to each
patch, you may add them per patch instead, after the `---` line, if
that makes it easier to track.

I hope that helps.

Cheers,
Miguel
