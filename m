Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VF6MStIi"
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC53CDC
	for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 01:19:27 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4649299d0a0so1478946137.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 01:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702372767; x=1702977567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1+sprVV2T7W4J6YbeGw0M4DLw9yLV+04VHxcEgbiHE=;
        b=VF6MStIi4ne9C5OIscvkHbVrlu2pO8w22M+lO9Whw+alY9qC+AvpQb1GV5w0ETBfLO
         zvBJlC+7uDFdiwv2QHZ6pDztMu+OEJhUIOP3+C5CcIVMhjPOXJByhtM+wFTYmIAVzXWe
         AnqOfhNr0vxPUa4csT5LoUDIqZjbwWs4yBWWA+rRyN1wEgxVn6pcJFS7wt4GkT3ORaRO
         bcV1cxlcQxCgF0Ywk83fIB0ZZ+zanmWesREVqrITIx9j8CWhGNdJjDoyVXzP0DOLR1j1
         RhsOSb6RiP/TU7VUD8hYva/b4FC1Vy4YOxOlPl7TPgl9m0vU6WK397MuGFWkY1ANptn9
         pG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702372767; x=1702977567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1+sprVV2T7W4J6YbeGw0M4DLw9yLV+04VHxcEgbiHE=;
        b=JVzIQhyhVIQYTBXJ8tm0nNUe50xHilyIY/NWFQ3rUqT+uQz1d2aPiJSYzuXc14Lg5/
         dvUuOEHbfQlomQSb9r8hyuDOKT3Lk2V/ZlkhqEzgmP8DwDw6109Z7CwOpD6CTvAX32TT
         5pO7kG/YHlBpuv5Wm/0d+IzTAT//4LPcYENTYdxt8HvD2ydABBFMdrDtBY8Cxc4xt3iA
         FXtcM80RLizN27wGckjcAyVhvO0cNGXTWhYujcENd6q3POecak/DbBW0l+bHufsKz6us
         EP9Z3OLSg2MfUy8OJ6t5ZrjnJuKCB1ABaPwWYq1iibt3d+mOn8zN4O8WhqGvdBp5VmNT
         aUhA==
X-Gm-Message-State: AOJu0YwjpR2gpFK7mffI+TaxtdmwFU/EGZH7hsf68XTwOCuk+LsVXUsf
	tcGxG2ARjKZdCCwx8O9jFa2JHccqRAyZwPfIxbp0XA==
X-Google-Smtp-Source: AGHT+IFqJB+r/gsMDbV2/WNS19JFr7F48BtZl+nyDy6AprTKQgrh4j3tEOIOJLL8ULgjzuUOsYiiDE0CKLWUr5C+7vQ=
X-Received: by 2002:a05:6102:4429:b0:462:e85b:b812 with SMTP id
 df41-20020a056102442900b00462e85bb812mr3950134vsb.24.1702372765514; Tue, 12
 Dec 2023 01:19:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
In-Reply-To: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 12 Dec 2023 10:19:14 +0100
Message-ID: <CAH5fLggpyxJfPFvtYuShKnT0mjcHViv7NQcBS7M--EK4jJHHRQ@mail.gmail.com>
Subject: Re: [PATCH V2] docs: rust: Clarify that 'rustup override' applies to
 build directory
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vincent Guittot <vincent.guittot@linaro.org>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 8:43=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Rustup override is required to be set for the build directory and not
> necessarily the kernel source tree (unless the build directory is its
> subdir).
>
> Clarify the same in quick-start guide.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
