Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A57238E107
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 07:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089436; cv=pass; b=aaAkpJZrcxtNtVRyy2mYHEDslJpK3Suw3bbkgR+NPUP2sgPIb+/e4qzqvqUuq4f7NXIRqRRvB42/936NTrDS7phAXk90/WCsPrG2hmB6uhLF/9covrwpLCa/90m8L6kPwZdIf/8BxRvXbE02JZVW7HmAJCfZ1XNhhzwZd6cs7OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089436; c=relaxed/simple;
	bh=cU8kstGq7wsTED11A9VZKDHW5cCpAiPQ9p/QVxV07WU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1uiySULB6irMjC/X8+d+frjuET1IoNu7zzd2wPHWzM5+SMkfrbzfwLJZLd9/wOvJDpamS4QrHt4n8HozOq/wak4qz5O1lKbcP4jY/89RwKsrQoGoCemHQWi+i4dbOHm9zf1mmg9u/snQ7gig92Aq1P7Cd+Bm5ndcNJGSyLHIB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrZTwkZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNPiDZSA; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrZTwkZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNPiDZSA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V64H2996661
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 07:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLrxoSzHXhl2Gv/xx7gH4l/8foTy6gK4EWkBQXv8dA4=; b=TrZTwkZXN766VfzU
	hYO0BPsx6HaB+y4L7w1N10XXNN5xC8M5OOpnnrqH92Yx/hRuCyH57kfpar8/EEkO
	cWr5Ykehbq1TWs6G3mRRzo1MWfo4HGZrCJw4TpARl3Kxw/fsN/VaME5USFGpflaJ
	zjWknEgJlJaukFg4uyard+HSjUusbeR1D/tWyMX0N+gbt3hPyI+AGx8OpC1m9OWM
	gGrs0vqALkamusCakiWoWBqOufdD5zGmMuKZeXVht+6Ka8Q4BuunojTCIkg+/tEG
	JuQDNlsiBeBBrbZy6iQ+4Dya6yvi4qebfsnFyvlk0p6oEz9wei3XASTqpRYvMYBe
	+xp/FA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9k7xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 07:03:52 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679c6ef1538so12699486eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 23:03:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772089432; cv=none;
        d=google.com; s=arc-20240605;
        b=Hto76xzUsIFINDhJFyjXSiMIhqW+gQfU2wGbK3gF5HuXrkYiJ44Z6pLc1FpXNOHXjm
         az1Ja9mw6m/F4bRmxr8tMJ2pzxD6Ctvtdi3jubewh1lZk9TSwHNSJsmSf9ANCk+wvJLw
         THMA79sMCO6aN7lphmwfEAw4mUm3lihYBbLswQr2+T06t1eZ/BtRFYGFG3WyvbDFyFUG
         P94ArGb5/HmeOn96FtHdvihb1TsLCkZ4K8LNRgOTAIO2llQS3rq6SoVMN7wyncIcACGT
         lGQYUzrSNmGuMN7CF7nzdGe+/uS3EQAAwszykc+MTtw9OfxqO8gEXAizX+gpwcd7M+MQ
         idIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLrxoSzHXhl2Gv/xx7gH4l/8foTy6gK4EWkBQXv8dA4=;
        fh=akXOxWG11nYjKDkqw7R362ExUVt0sRbgcyOphHPoLAE=;
        b=DLAwCLxIpZspFRI5r+2el8/YsOnah+3QTfwd0xGfjina6G7wE97yck+GwVHFGyL0i/
         B1RYavFuVj8MExa0N0wjR13wmIw9jEW4CUihO19pQmfGFehlo5HLnZmAQjaTSqEbhJNa
         tXK6SkRWapQRiXfHj+wyjRctI8wrOKFg8AkmL1V8nBxxFgscdLtl8m6qt2GhEAnhPWmo
         5Wo1ObqipdEwrEh3rRchsD7pcdeSB5j7Hk9FEEOPyeJq+5d8KJNjIFkZbPY8q2emgDhR
         gHt7RxSwIdA5i6ayD+Xla6ZNpJahnll1Qoa+3J80p3ovYw4mPfURNBfJMW0QojRui02g
         S5jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772089432; x=1772694232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLrxoSzHXhl2Gv/xx7gH4l/8foTy6gK4EWkBQXv8dA4=;
        b=DNPiDZSAueMHbQqReqLk2SvfX7gID6B0+/tR8DbE9Ayr66T0KkHl/kVV7/cQzoMY9C
         FXjHqBC9dqFUlfiVGgGnt/Oy2BsZ+4gMM4HR8sTekHYGk0r81EC3FmnnIGzDmz5bRIth
         r5UP5yS8yolCy4wQ/w2Uf4RfnT27xZZGyuiCC9dsurAEtyLEQZhRsaA0HTLS3vku8+nd
         Ssxq3LyHINcOi1OkfmjjTF/stxjKn2nWIt3nOp7uYPoiLsuQdTJVPVWrCqtO7FwqVMiQ
         r/9qzR7NgIXZAMcapRP1efde/F4HVxGLPk3MCFF8i2LMlYwyRvd0p50KG4L+GeoQRr/t
         kU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089432; x=1772694232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLrxoSzHXhl2Gv/xx7gH4l/8foTy6gK4EWkBQXv8dA4=;
        b=kZW5EcjukFtXRVs0ykCGj8EUbGTC4nsaSQnk4Ra/fQ2fXHmIVSiC4x1wbojH7lPzBc
         vdXgsdZCV7zzTR50hSMfD9ycDESpvpYERWLISH/rSzVhZlS3SDiOIOzpWrjLAvtAKEDL
         tHIrwyP0UC6ffBmL1PPfAWCLmBxRl4aPqsZWTZwWGn0LI4daOXVbO/J7kRBS1OR0Qjrb
         C53zXNXOULKXHnfr9mYbwSiE80bQzXoQO6cdlbhWCD1jPO/Cz+LeKxEeJh7SUqOnKtoO
         nmjGLIqYdz3DWCJq0djBc8KR+eMa78VEy09oj1dJCGF5QBlEwRMIbvsNA/53CDS3HIK+
         rx4w==
X-Forwarded-Encrypted: i=1; AJvYcCXbMbbYEtOZeeSCqJniApwWXBdP1j+SupwmwDpxq9NH2ItoE9d8ZXvY6XlMpNYFy03QcNvqYNFA17I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWpkArpm/6PSp0f2X7TTEI5yHvL1RLquViudzo/YRLA2kllX/5
	3epfTknYJ86sKYK3/Iw5isnk1Djt65pBli4U8Y9qmRMtO0Vbyr5AcAC+jo7RlO03e9XmevvQc2H
	ktNOK8jHoKeQUZTqTSgS6o7W1YhoEbATPvL9uSO14cYwhE4w5/lVSQhOA8QO4TbDljV4NmEpzKI
	o+ApGF2EsB9/8WCw79g2O/GQw6Qu3PGba2aLCffQ==
X-Gm-Gg: ATEYQzw7V39pdQaKkZWiDXMx6HhW1sMnqFreENThO5eEidGZZVCgrJ62kFT1JB91aWi
	NfuHuYN54Cm5vYBq0T521jBhfkPoqhv3KIPGmgaR6Jmv/w7UZQKJ4UM5kVecRDe459a4jNs/Hgj
	Pu6eGOiL/J6P8DQyiDXY4dyZ1C8j6oOpsQAMcJOCL8s8fE7a/5vQHwpqPcaYFomjM9Bc8apJ5cv
	s1SujU=
X-Received: by 2002:a05:6820:3092:b0:679:e7b2:9fc7 with SMTP id 006d021491bc7-679e7b2a0cdmr3151076eaf.7.1772089432090;
        Wed, 25 Feb 2026 23:03:52 -0800 (PST)
X-Received: by 2002:a05:6820:3092:b0:679:e7b2:9fc7 with SMTP id
 006d021491bc7-679e7b2a0cdmr3151054eaf.7.1772089431697; Wed, 25 Feb 2026
 23:03:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
 <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-10-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-10-347fa2d7351b@arm.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 12:33:40 +0530
X-Gm-Features: AaiRm51FKm_5e4UXBRvPixo-zTWKoFuxZQdWEORZL7vufbjHjGKj8isrvlHHmUg
Message-ID: <CA+Ht8=ZSUGF9KQqy=yZ56kEDwsv3TvS6rLcMD85iwDxwOr3rpQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] dt-bindings: firmware: add arm,ras-ffh
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
        robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: TzFhdYKsO1S-zJ57jlkcnhT6xa9DiuUz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MSBTYWx0ZWRfX+uM7csMFTcy8
 z/lioGYd20MhME472aqH68YK1S3zAhEUnAYG3oAG+D9cTBQwiyWuJOVtQNYLm/uzUGX4B+YbV4/
 77ZHnQZxdHIa9zQN1VsxK4clMVM2CewHZ1Tj+Pel9NMJS7R86CHX7EaIYvIKkE/C2iZkqzm/dnD
 Ijkwns/t/kUJMwnWYnYjT8yErxP52EnNwpUoVKvmk+XWGdbrI2/TlpopBhSDh/vm1FkMavzeuca
 C1t0N+4Nr2jcTpYrCu4RRMZq6zA3MKXbtWiJTYtNfpVm2t6WvmBv/OVnY2weqAw/+N5QTbM+7aB
 0vY6226jLlL1MNJjSKiyaHzU1TuA7U71mrO+kxnzucTuRX9FerRc5wAmgctSxP2beXeGE0AUrxx
 gxkohWthgbzVDxVDH1oRiOrBYGsByZH6TmM0qv+TA0i9Tuv5ZocF1W/wWiRVThxpl+wal077ow5
 FcfRdfMN0937hHhjo6w==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=699ff058 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=is6-GLeS1cJyDfTUaQYA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: TzFhdYKsO1S-zJ57jlkcnhT6xa9DiuUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260061

On Fri, Feb 20, 2026 at 7:15=E2=80=AFPM Ahmed Tiba <ahmed.tiba@arm.com> wro=
te:
>
> Describe the DeviceTree node that exposes the Arm firmware-first handler
> CPER provider and hook the file into MAINTAINERS so the binding has an
> owner.
>
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  .../devicetree/bindings/firmware/arm,ras-ffh.yaml  | 71 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 76 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml =
b/Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml
> new file mode 100644
> index 000000000000..eccbaaf45885
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/arm,ras-ffh.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Firmware-First Handler (FFH) CPER provider

Please don't called it FFH. FFH stands for Fixed Feature Hardware and
ACPI uses it at multiple places. It is causing confusion.
> +
> +maintainers:
> +  - Ahmed Tiba <ahmed.tiba@arm.com>
> +
> +description: |
> +  Arm Reliability, Availability and Serviceability (RAS) firmware can ex=
pose
> +  a firmware-first handler (FFH) that provides UEFI CPER Generic Error S=
tatus
> +  blocks directly via DeviceTree. The firmware owns the CPER buffer
> +  and notifies the OS through an interrupt.
> +
> +properties:
> +  compatible:
> +    const: arm,ras-ffh
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description:
> +          CPER Generic Error Status block exposed by firmware
> +      - description:
> +          Optional 32- or 64-bit doorbell register used on platforms
> +          where firmware needs an explicit "ack" handshake before overwr=
iting
> +          the CPER buffer. Firmware watches bit 0 and expects the OS to =
set it
> +          once the current status block has been consumed.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Interrupt used to signal that a new status record is ready.
> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Optional phandle to the reserved-memory entry that backs the statu=
s
> +      buffer so firmware and the OS use the same carved-out region.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    reserved-memory {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +      ras_cper_buffer: cper@fe800000 {
> +        reg =3D <0x0 0xfe800000 0x0 0x1000>;
> +        no-map;
> +      };
> +    };
> +
> +    error-handler@fe800000 {
> +      compatible =3D "arm,ras-ffh";
> +      reg =3D <0xfe800000 0x1000>,
> +            <0xfe810000 0x4>;
> +      memory-region =3D <&ras_cper_buffer>;
> +      interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8d8a5c41597..47db7877b485 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22027,6 +22027,11 @@ M:     Alexandre Bounine <alex.bou9@gmail.com>
>  S:     Maintained
>  F:     drivers/rapidio/
>
> +RAS ERROR STATUS
> +M:     Ahmed Tiba <ahmed.tiba@arm.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml
> +
>  RAS INFRASTRUCTURE
>  M:     Tony Luck <tony.luck@intel.com>
>  M:     Borislav Petkov <bp@alien8.de>
>
> --
> 2.43.0
>
>
