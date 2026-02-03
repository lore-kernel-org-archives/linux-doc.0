Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A2349B1F
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770123634; cv=none; b=NlLJrio8QuR/K1DxAUXc1Vt/3zM3TbjP7OmCGf2F3c51QUto7TPf/3F7tOriNsgXOA6BYFwdKTosQPaUTZxI0Wp1gxCSfFzhVoeu1Tw2xe4UrgYrQowhJNoJDuh2e6DLnZy9o/sfyHQwmk68HHAte0mVtwnqi49961wbL+4IUPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770123634; c=relaxed/simple;
	bh=QfrRwcFVbs7HXzfXIJF1G4CMBzqUTb6IXs918LJA2kU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YaCdqP6EQ0sN6ROlLj64CMufmgfWvd7it5iuU2H7CYUagYMA9d4+aQ2YRG9dDbq5JpecO5/6I52kFO6kb8CmjPJ77W3lFnMoa63oXh42I4S5jbZ4/eZbpgP/riryKgsDZuYokEL5gr6K6Kmz4EowumTvwVS9rz2RLHify25mBI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jq1nVgbE; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jq1nVgbE"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8845cb5862so878144666b.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 05:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770123630; x=1770728430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfrRwcFVbs7HXzfXIJF1G4CMBzqUTb6IXs918LJA2kU=;
        b=Jq1nVgbEc+QRabvwNxsoLVixZKeiz+URccT9hmLyh3PN3UI10sq5mJ22vC4Frf/nCa
         Kxh5bdG/hqXZ3KUTYO+ZMqio6iYJSy5VMhevnvhLpYQJ22ChR++nZ0zmoZXZXRbtRcVY
         6WajfEKdp+z5NbuFfZcHPM8I2JGFPFddBnh0qN7Lb0Oa0X9V23GlteZla79cY2xLMbxN
         3GQpxwqRduDa4n+ftM4gkrMkm0+zG8Agie6+D1ECW6CESzw9dstQPvN7jeYOrGqp4xjA
         YMtm/b0j2DEgJzZtYxrEdpx2ODT8lTkvkQbKjLV83l43AIh5UQma089ZXLJLMgjbWQfM
         Secg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770123630; x=1770728430;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfrRwcFVbs7HXzfXIJF1G4CMBzqUTb6IXs918LJA2kU=;
        b=hnvpIPKBrNowhV/rchPzRj/ZxtqD/12LoIPWpqBOgWuGUayxuTSMYwAQIvCbwksNwZ
         fLfZkwMIkElktU+hX8tiebpngcB6U5haUo/2T8TPV1q5rxtFw6ICEADOuMjyFyVYjLgT
         rTiVbe+sNBa1BGsDSZtlOqQR+l4ASzl6lainJENT7ljjvXYuBkbVvvEbe/KEgBhpIZJ1
         6ULk3axN0rZpA+PbBJREFNBo0Mj9G+v7sW2Yzn5qnvAAPGYqeDL+RWQBxItTaAYMA5iQ
         o3dR+ZQqAJ9YkJ1Ca38mtayje+2Z9aFpPLQyWllrAY+7nzOI/hYCDOXuZfjKfwl6XjQt
         rtxA==
X-Forwarded-Encrypted: i=1; AJvYcCUA8pxESDIppwFs88TQCbEdaGeAKg8PCTEwAsoeKmLWI3YfXLjmq+zJGdv2OR6wr8IwFTVuyvsnCf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+nVPCxVrGJpbqQsGGh54HVFUhgNg3ylo+MzfqZfb8tSEwdW50
	bqAWL04AnkfmQ/oWs6+Yc3mI5G4j+l22cxNRNuOcJdalxsmQOOuIONujT7KIy1eN+BY=
X-Gm-Gg: AZuq6aLx5q4W8ee3OIq/z38Pw4Bim53Lg3UceELH0O9ePT69i7jbwcQfrojWVRXFzgM
	q3X3rgdhviMnhSx93/iGpkLLXk3NuLvTx5m1ZUyXnN6nwFuxFpqwxHiEqnrhF5DVPBHdD0w/ujr
	Oy+jb3r0A/5uYtE/D1TzurfeOvZScb56RwW+9zoAVsOS9ZO0qwqwMwLAq5u4VDxP7juE1Pn9d6C
	UmoGXfmiMCWbb63FHpKcRYCY4+uH/6G7HvAPA+DgRNh6a7tqpDlE4hkp0MubhZIUj8K++7sds7d
	oT3iIWzRjwCgAkf1zxGOtiIHpXZitsnShxRk+j3VZTrNU+MaMQAfcEmRF0WTZl4X/SVYJJ8PgcN
	bFABfB3gKIx3mgE/We2Y2kLJcL5TWw6CTiJ8AW6sjGRYnZA0q21AjwcH0wlXeO985H+nhYxJH+D
	vMgGmQzGzMWWk=
X-Received: by 2002:a17:907:1b20:b0:b86:f558:ecad with SMTP id a640c23a62f3a-b8dff5260f2mr877455366b.7.1770123628657;
        Tue, 03 Feb 2026 05:00:28 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c5b38sm1024503866b.53.2026.02.03.05.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:00:28 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1C5C05F841;
	Tue, 03 Feb 2026 13:00:27 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,  Joey Gouly <joey.gouly@arm.com>,
  Catalin Marinas <catalin.marinas@arm.com>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Will Deacon <will@kernel.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Oliver Upton <oupton@kernel.org>,  Dave Martin
 <Dave.Martin@arm.com>,  Fuad Tabba <tabba@google.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Ben Horgan <ben.horgan@arm.com>,
  linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kvm@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
In-Reply-To: <20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org> (Mark
	Brown's message of "Tue, 23 Dec 2025 01:20:55 +0000")
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
	<20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Tue, 03 Feb 2026 13:00:27 +0000
Message-ID: <87o6m6nfro.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> writes:

> Update the definiton of SMIDR_EL1 in the sysreg definition to reflect the
> information in DD0601 2025-06. This includes somewhat more generic ways of
> describing the sharing of SMCUs, more information on supported priorities
> and provides additional resolution for describing affinity groups.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
