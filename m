Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F3830B52B
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770320080; cv=pass; b=Bd1Z2j3MShJ9lLHSUg5WIxuw4rR1FpXVhNVosdusJqEejccelrrExC/88xDZtPTFjz0N+6WsssXWvaZ6H0SGTEN10nByVD60fIHJESL9gMfd02RNa8XNUStZJRkbxzpH6+VSOnQSn7fPhis/Ss4LCgVIQqgAGTOy1HHwD/aM/L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770320080; c=relaxed/simple;
	bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8s+zJQvsLxz8+dSJ0vy9hPDtQWf7UlKZe7MlGMxdymnBEj4NUrcBmZkplDOQMWekXZZ+zc+abjFs6PvOogj9q41m3WoZxL8nBSR2QZ4bekjTrpWUvgPpbueZKYU6jrpzKCFTh5AgDJYI6GUhsx1wMc+GmlHD4omoQeOAqvu9k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl4qgpiB; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl4qgpiB"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124a2dc92dbso57326c88.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 11:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770320080; cv=none;
        d=google.com; s=arc-20240605;
        b=klPoV17NwfchWyTD4YkjawcEyKMnHM+savZfYGJxK58KXvqovjjrTOrxBDPM/JN1Gk
         ZMHcbLk6sXYz1DDrHplS34qMP2VEKkllBEz9VAbiZjVAsyu21XrIOdkTu+ZliGtO1hnQ
         bDRsQQ4zNN3Qt0n3f39YbBOCApT9DVzqktDq24nPslNBFqwG/gsJvrDZcHfoLRs3+MKR
         9kJx7VOXAFFugNBNpQxIEnk3r4L60e1jFNejFUCPYPnMhqwIC9g63iryeBVfzvqT62tZ
         t4di6tFqGkFmqCQdwMoafDwuj/cOvXzsVwkHrwm6kOCQ1v6DRwm9iGCS4Tayh+876tpx
         5Mhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        fh=VvifX8n8vB8rWuAP3HWk0jLZ4aRGEvV+qKp6Lc2b9oI=;
        b=W8d/WAiTtotR7zJaUNPIo/GmjTldfJdwRVcbEXA7ustRPX6qkdbQY6O2PgkF4zgP9/
         P0IA8I9hgCavNi6MhJWXdmc0fRgcBJVwqiU/yeI+Ao8NVEulW+f/IJmMI0Qdkm5A//Z1
         OsB7CQdcWNY6Bl/5fSM5ZUmbSzvspd6DXC1lbSUX2M1cuY+wG8MVwKAdx6O7CeGj8/fZ
         gVvx91tkohYOvsrygIavwywDLZ97e5ixr5LGmwU2b0ngtOyz1YTdFOuvUB52ToHWOCpX
         UDy4vlWXJ4itR7Wzzbr4lSIo1FOE1nCRLZR9rUOXU/9cUEYLLAyxpGQepmweOHkhPhJv
         4Grw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770320080; x=1770924880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        b=Pl4qgpiBz3Ep0LW1nXK/Fm3tEsrOxZMWBFmPCG5C86+z2yUX0Ku4VAsBpfAk8XzfOY
         v08Guguxr3tPQadRlI2YHWFi3gq61Zo83w0N1fBTacNuRa4oMSySxGwFwDG3YqKMxk29
         YaC1EPR8kLZ7fewjjutcfL+dPUVl2iKwLhFa+X8Na8VKkjzQyhGZ7TWzs+nDjj/53np0
         BGc6V5lSaGCvd9rx8iBXg9CljYxAb7yo5ndHq0E+q+pUZHI2Z41QBvb/57305j68EWYR
         xg1IWKrAP44iMn1BV8iz61tVFRGMqG1lWYkFuAbJD+MQUjblF2c70WliYULSu1K8mU/K
         vbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770320080; x=1770924880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        b=F78gcTc1gha7LEEYfX4RmXItREC/FbwwCARI0O82ayOoYaL0p84OlI80JNUS5JVwu2
         8G4iRe2MMCo0SBZnBHF4jaM1S6xKZec3e2aeQCcZ2NAvi4csmHRRzGlI06UuNhdvSVOH
         akOzJoNOVn0jced62doxY7SgofrFJJYBY35GiXwDTcEc5U7+Z+0Dt252BjtC7laS1IDt
         U21HKBKzH9hj4a/wM33QoOny5lOmbd2s3dV473HxlLSH8+Grnb7H3AWJoJHlUCsiT+FZ
         ruSul68yXj7LQo2ZrhUNGZYoz0JIQ/pZLPUI7ddCFj3cJFXZo3a3S4tRYndCPsGazqPL
         3AvA==
X-Forwarded-Encrypted: i=1; AJvYcCWXFWkrABQ6da7Id2jEYIuuyc3JeWI2nQJrU1l6vHFSXDDEvkD3j/O6pg2QC7tCfvmxSWdIJ/OxKFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxweu/corJQGz5eUelaLmUaQvZrPdb0nzR/EuCOVn0nnxxwaEt4
	JewpKPjBnFLMEpK4T+v1k7zxtdCD+HDBLCYfYSOsQIifLffnDKzA+Okny7ba8nsc1NSM/tSt12T
	m/Z03JkHkex5N9lySC7ZIugWPqKcOkgw=
X-Gm-Gg: AZuq6aJweJVi+nh3TgK0TB7dTUzQta1pbnVCBxighp5j+WsuiHqnfPJqdTNaynJHgHU
	Mx5PAQd7iOna6MTunS+YifUAk6Ut8PojBFnAqSRqskDs6+UU9/F9tGmACW+US0muAzr0NHqoX0e
	dSFFwZYNHaIavRQKQOqnwoxz5CKNCrXZoX8EiS6/i9ohBacqAZS9X2Lf+6Qi9SvOK0cnKllrT2J
	/BDqA4iJKoFLE8C/4VLy3JzEbARa2TUAKhN9fTf+aFcQ9ersnGHWe7o+bYddygDi1lfWTjcLo7T
	drcaaoUQx4lwhx/t352KSwBm1rImWPFBXtR2Ns/O1mRIfgBF8MZBj95J5XW4Ti45yFytZqKacWM
	bOe32uA+tOGdB
X-Received: by 2002:a05:7301:1f05:b0:2b7:fac6:a9f4 with SMTP id
 5a478bee46e88-2b856a4c965mr38975eec.4.1770320079827; Thu, 05 Feb 2026
 11:34:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com> <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 20:34:27 +0100
X-Gm-Features: AZwV_QiXdOwsA6Cs9ikWk94o2hhbKT_np0MzoS_FXf6_Mvy8gIUKQAkUYwzBM0s
Message-ID: <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:29=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> use rust version nightly-2026-01-28
>
> the latest one has some issue. I just raised a bug for the rustc
> here[1].
>
> [1] https://github.com/rust-lang/rust/issues/152177

It appears to be a bug in LLVM 22 for ppc64, not present in 21.

If I understand correctly, then it may be fixed in 22.1.9 if it gets releas=
ed.

Thanks Jubilee for the quick reply there!

Cc'ing Clang/LLVM build support, in case they didn't hear about it.

I linked it in our usual lists.

Cheers,
Miguel
