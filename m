Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78FA79B99
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 10:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712226867; cv=none; b=uRox9PGyYflcTeU+sxDeLJxzD1+5zWaEMIArAbHGhSwFs3TzP2TJSWbAk7i4XkbNT9eZ7ioeiDAGw1alXTik4hJZnIC+p0BLzgaxjMocCyCA9q6zv4JHexW/cAHEb0xRzQe/kiDC2GLBstTQEa73DJvXo1bblSfo9dVMe1r4sIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712226867; c=relaxed/simple;
	bh=2/q4jfOj6U1einCYXJdHvK78eAQ3vHaYbSRzBTdpsBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OWS5a7Fk2WrZ2QsP2D6g5EAmoOugBkUNqOD+D87hz7pwSce76rMqc5ZWsUSVQuw8zgRqfkhWmUgyLbnoRmKWYsgGw7ta9OPvV7SXKROBxKbjAz12+qIXVE32oiQmE9afgDb6XLcQ1NFvsI6YIHz3JpvJeXkkJg1QYRdfR3ukZOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=m9/oW3Kj; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="m9/oW3Kj"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d82422d202so1477271fa.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712226863; x=1712831663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0yWpEBMuRREaN4Rfpr4/p3Cbe2kX6z7SdkYvYffV00=;
        b=m9/oW3KjpOr27N9nfPPmNzaCEB8cK9KH3zQA+Xy7uidbef5hRIvmfyD1u9Y06YStT+
         BzPXWgetDznouQS8INkOz2wS91EWVtiApc5C1/l5PhRXvJhKI4+/+kX2gqDhpRIJrIi5
         HUeipZ+CFkuPtDzHlw5I4YWsYBMydVUwnJ7UKmE4RH4HjmQIw3TDdx0uXM5vnB8NA+fv
         nT1CCzOP+mdWKaAxpx6Wo5GWFhLq/TeKDcxbUXNkhuR/f5k8Iwa/RQKndW1+aKlQ6Uum
         DkdXKyrZ14urAGlK7qL+nAvTTf8kZEwT+BF5nAlk8WypzhpmTcwnHa4bBu477jftqZfc
         ZArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712226863; x=1712831663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0yWpEBMuRREaN4Rfpr4/p3Cbe2kX6z7SdkYvYffV00=;
        b=nxS9KbYypBiZpGH6M/Gz+GkNHmYOs4F2lNQ2vluWlGaYhLRMQz3h5t6gyBcj0O1nYU
         vRFv+sZV4Qwi4D9+UruwYZJzZcOBR42GkedHmHZNPsL+jrr+pT3UBg5qykVDPx3K0HSK
         o7pVe+1BHi6yq+e7UyorGAaZhTZMhQsFNW/6WfRF70aJDvTbUMtkg5H0arEX1S8P5P+k
         +rReabjiaRqW0X2I0nHu8UHAl55qmevCX8P/k9PtjNMVKjrsqSxU+Ov5qyQ+HV1meKz1
         7CfVB34Eb8zA5fv2MnRFd7ylcO+8/ClPMoPY1fwaWfohrROvgoB95fERu0c4YUR+H8bM
         rIGg==
X-Forwarded-Encrypted: i=1; AJvYcCWLmZK4cuytXNnz5YuRRpLM/Z/u+fFXhvpCYMej7zRKv8YZZK0TZiXF23duToSgm+C//Kl5VcKiVbvEqLIYsU69A/KVE5EufLOs
X-Gm-Message-State: AOJu0Yy5wu5zC3LyFaq3xFDBC3Po1fqKhyuS2OBTeUOI82juacE540sh
	xeq+TTnjBL4KZkKR/h6sXaAc1VN2O5j9jvQLKgwnRS8JNXmzL7nMWM9lyFPBW3g=
X-Google-Smtp-Source: AGHT+IGgwXcPXNss81WaNWWIVnkPiMwtrKqgSEy7SDtHw2OIS4sQFnmrJ6LWngbeMCuWYCY0SDTSXA==
X-Received: by 2002:a2e:99cf:0:b0:2d6:c59e:37bd with SMTP id l15-20020a2e99cf000000b002d6c59e37bdmr1469136ljj.3.1712226862690;
        Thu, 04 Apr 2024 03:34:22 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:555b:1d2e:132d:dd32])
        by smtp.gmail.com with ESMTPSA id ju8-20020a05600c56c800b00416253a0dbdsm2171340wmb.36.2024.04.04.03.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:34:22 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/5] Add parsing for Zimop ISA extension
Date: Thu,  4 Apr 2024 12:32:46 +0200
Message-ID: <20240404103254.1752834-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Zimop ISA extension was ratified recently. This series adds support
for parsing it from riscv,isa, hwprobe export and kvm support for
Guest/VM.

Clément Léger (5):
  dt-bindings: riscv: add Zimop ISA extension description
  riscv: add ISA extension parsing for Zimop
  riscv: hwprobe: export Zimop ISA extension
  RISC-V: KVM: Allow Zimop extension for Guest/VM
  KVM: riscv: selftests: Add Zimop extension to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst                    | 4 ++++
 Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h                   | 1 +
 arch/riscv/include/uapi/asm/kvm.h                       | 1 +
 arch/riscv/kernel/cpufeature.c                          | 1 +
 arch/riscv/kernel/sys_hwprobe.c                         | 1 +
 arch/riscv/kvm/vcpu_onereg.c                            | 2 ++
 tools/testing/selftests/kvm/riscv/get-reg-list.c        | 4 ++++
 9 files changed, 20 insertions(+)

-- 
2.43.0

