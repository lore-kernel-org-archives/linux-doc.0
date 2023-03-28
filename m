Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72982C761A6
	for <linux-doc@archiver.kernel.org>; Tue, 28 Mar 2023 10:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjC1KNU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Mar 2023 06:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbjC1KNR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Mar 2023 06:13:17 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E53B9F
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 03:12:54 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q206so6851389pgq.9
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 03:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679998374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur6uKN85TYQWLvCxVJ2c6x3zzJWUhaZqRctpfFiWUIw=;
        b=jMVlny30ljZY/tcBflSVwe7xsuCk1ZeRa8ALY7gPYkfVb1fk3X/qS20c7qeNCwedo8
         9fiMHOM1EmovhkAcm1B90c9lq3ijj7SE+2HntzSi8o7fNqelTbWHeSaKXhx8a3SbC23L
         B3nr5bKH0OlufphI3VzSGZqK/YQJuw504YuT0K4IneZbcXkUocTqRJciPmfe8ARDEzTR
         8j2aN8JQNZd3qBNZlpSfeJeD3j+hgUIhSUk1UDjMHEyCLLCT64sYQZn2QzOayHSQfzYi
         vgzAQifxhoSr5QRskxbasBfNmluk69H7SVvuPqVVfDysWz66UMivERFjTNbT2pGqBSTg
         dqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679998374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur6uKN85TYQWLvCxVJ2c6x3zzJWUhaZqRctpfFiWUIw=;
        b=qfxQyc9YoIp3ja81toHHo4Tuyu+xy6bXTpbQaX8JKrMuPM4HPXlj1xEQ2jcxjIAi7p
         zK09O/7Ojs+xSifOX+5vJtrGABJC+S/V74x7ThveRbidWrRZLr890c4Yny2dse0yvMtb
         wCC80PQzKymH4EkQMiCA2QPOrtrFx4kMtk1u8oyt7K96kUrtfeKmjGqh7hSkMFWwFxoM
         vcweILSCTsBM36t70rMzyrihqgiPOaLq+KMG9U8CIkeZtr9NZsXa2+A7HJLWeyCraJHI
         VCkL8OMIlud+LULlhWV26nyVSm6eKbfEVRamGOfkV2aeMyNM/DQI4Zkp4uNVbjeAw0rQ
         j5zg==
X-Gm-Message-State: AAQBX9fYQQop1OtAIRq9GeLirX4Y++tQpBLJITJfcRZl8c1A0obW7Qz4
        xYxVze2uW/E6GzW6v4M/e/MxzUBJnyYbWGpyDue6PQ==
X-Google-Smtp-Source: AKy350bA0E0pgZejxVtJ222F9kw3bBsx4EpT493ao0TPM6h4l4h3va196sNgYjfU3tFvV53zdC5WKFAvD4wLwA7gH9k=
X-Received: by 2002:a05:6a00:1827:b0:622:c6ad:b373 with SMTP id
 y39-20020a056a00182700b00622c6adb373mr8123366pfa.3.1679998373864; Tue, 28 Mar
 2023 03:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230324061608.33609-1-quic_hazha@quicinc.com>
 <20230324061608.33609-3-quic_hazha@quicinc.com> <e51c200e-6de0-d516-3f32-28367b2f5a95@linaro.org>
 <e6b0a542-17d9-290e-7c84-8356a38d6802@quicinc.com>
In-Reply-To: <e6b0a542-17d9-290e-7c84-8356a38d6802@quicinc.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 28 Mar 2023 11:12:42 +0100
Message-ID: <CAJ9a7VjC+1m8odyotBoG3EPAL=Cn90fCCY1xPGFyg8uKEar7nQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: Add Coresight Dummy Trace YAML schema
To:     Hao Zhang <quic_hazha@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

As per my comments in the previous patch in this set....

On Mon, 27 Mar 2023 at 08:38, Hao Zhang <quic_hazha@quicinc.com> wrote:
>
> Hi Krzysztof,
>
> On 3/25/2023 7:49 PM, Krzysztof Kozlowski wrote:
> > On 24/03/2023 07:16, Hao Zhang wrote:
> >> Add new coresight-dummy.yaml file describing the bindings required
> >> to define coresight dummy trace in the device trees.
> >>
> >
> > Subject: drop second/last, redundant "YAML schema". The "dt-bindings"
> > prefix is already stating that these are bindings and all new must be DT
> > schema. You cannot add anything else, so this is redundant.
> >
> I will take your advice to drop redundant part of title in the next
> version of patch.
> >
> >> Signed-off-by: Hao Zhang <quic_hazha@quicinc.com>
> >> ---
> >>   .../bindings/arm/qcom,coresight-dummy.yaml    | 118 ++++++++++++++++++
> >>   1 file changed, 118 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-dummy.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-dummy.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-dummy.yaml
> >> new file mode 100644
> >> index 000000000000..7b719b084d72
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-dummy.yaml
> >> @@ -0,0 +1,118 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> >> +# Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/arm/qcom,coresight-dummy.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: QCOM Coresight Dummy component
> >> +
> >> +description: |
> >> +  The Coresight Dummy component is for the specific devices that HLOS don't have
> >> +  permission to access or configure. Such as Coresight sink EUD, some TPDMs etc.
> >> +  So there need driver to register dummy devices as Coresight devices. Provide
> >> +  Coresight API for dummy device operations, such as enabling and disabling
> >> +  dummy devices. Build the Coresight path for dummy sink or dummy source for
> >> +  debugging.
> >> +
> >> +  The primary use case of the coresight dummy is to build path for dummy sink or
> >> +  dummy source.
> >> +
> >> +maintainers:
> >> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> >> +  - Tao Zhang <quic_taozha@quicinc.com>
> >> +  - Hao Zhang <quic_hazha@quicinc.com>
> >> +
> >> +select:
> >> +  properties:
> >> +    compatible:
> >> +      contains:
> >> +        enum:
> >> +          - qcom,coresight-dummy

Can we have coresight-dummy-source and coresight-dummy-sink?

> >> +  required:
> >> +    - compatible
> >
> > Why do you need the select?
> >
> This is a mistake, will remove it in the next version of patch.
> >> +
> >> +properties:
> >> +  $nodename:
> >> +    pattern: "^dummy_.*(sink|source)_[0-9]+.*$"
> >
> > We do not enforce node names in individual bindings. Why do you need it?
> > Plus underscore is not even proper character...
> >
> I will remove this node.
>
> >> +  compatible:
> >> +    items:
> >
> > Drop items. You have only one item, so no need for list.
>
> I will take your advice and update it in the next version of patch.
>
> >> +      - const: qcom,coresight-dummy
> >> +
> >> +  qcom,dummy-sink:
> >> +    type: boolean
> >> +    description:
> >> +      Indicates that the type of this coresight node is dummy sink.
> >
> > You just duplicated property name. Write something useful.
> >
> >> +
> >> +  qcom,dummy-source:
> >> +    type: boolean
> >> +    description:
> >> +      Indicates that the type of this coresight node is dummy source.
> >
> > You just duplicated property name. Write something useful.
> >
>

These properties not required if the compatible name is more specific

> Sure, I will add more details for it.
>
> >> +
> >> +  out-ports:
> >> +    description: |
> >
> > No need for |
> >
> >> +      Output connections from the dummy source to Coresight Trace bus.
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port:
> >> +        description: Output connection from the dummy source to Coresight
> >> +            Trace bus.
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +
> >> +  in-ports:
> >> +    description: |
> >
> > Ditto
> >
> I will remove it in the next version of patch.
>
> >> +      Input connections from the CoreSight Trace bus to dummy sink.
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port:
> >> +        description: Input connection from the Coresight Trace bus to
> >> +            dummy sink.
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +
> >> +required:
> >> +  - compatible
> >> +

The binding should constrain out ports to dummy-source only, and in
ports to dummy sink only.

Regards

Mike

> >> +additionalProperties: false
> >> +
> >> +oneOf:
> >> +  - required:
> >> +      - qcom,dummy-sink
> >> +  - required:
> >> +      - qcom,dummy-source
> >> +
> >> +examples:
> >> +  # minimum dummy sink definition. dummy sink connect to coresight replicator.
> >> +  - |
> >> +    dummy_sink_1 {
> >
> > Node names should be generic, so "sink"
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> >
> >> +      compatible = "qcom,coresight-dummy";
> >> +      qcom,dummy-sink;
> >> +
> >> +      in-ports {
> >> +        port {
> >> +          eud_in_replicator_swao: endpoint {
> >> +            remote-endpoint =
> >> +              <&replicator_swao_out_eud>;
> >
> > Why line break after =?
> >
>
> >> +          };
> >> +        };
> >> +      };
> >> +    };
> >> +
> >> +  # minimum dummy source definition. dummy source connect to coresight funnel.
> >
> > If you use sentences, then start with capital letter.
> >
>
> I will update it according to your advice in the next version of patch.
>
> >> +  - |
> >> +    dummy_source_1 {
> >> +      compatible = "qcom,coresight-dummy";
> >> +      qcom,dummy-source;
> >> +
> >> +      out-ports {
> >> +        port {
> >> +          dummy_riscv_out_funnel_swao: endpoint {
> >> +            remote-endpoint =
> >> +              <&funnel_swao_in_dummy_riscv>;
> >
> > Why line break?
>
> I copy it from device tree and keep the original format, will correct
> the format in the next version of patch.
>
> Thanks,
> Hao
>
> >> +          };
> >> +        };
> >> +      };
> >> +    };
> >> +
> >> +...
> >
> > Best regards,
> > Krzysztof
> >



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
