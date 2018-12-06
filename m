Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B493F7D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 02:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbeLFCIp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 21:08:45 -0500
Received: from merlin.infradead.org ([205.233.59.134]:44522 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728219AbeLFCIp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 21:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=k3inl5OnstSGTrWMnVsdzC7DKC2tX6iRJQVLY1TMSsg=; b=fnBU8t4wGCxrEQjOQA8/FKgpFV
        mssPWe9xC2c5ifh4rxu4DJoNEcni2yMDTlLpRL3btoyHO/wBGbWVsMtO0seTHJ2AzfZop/kKvhrjd
        SIm2qd9ZxDshrgroFNLA4ONX92HU8qadAv1zmqG03qD+bq6yb4jBd1Vh4al1dHUFGNTitewetdAdF
        LnjbMxsO9aEBaGEZ2efU0nFs8uq24M0sVqhnvCIGNKeg5V+HEg7+5QqJBEuHDxbZVOc7mJ4E09oqa
        hHByBDGtYNHr9+aDYd6NDF92zeC6I0oGz+3Ym//cvc6CNjRE88hyf8oALwO8Y3z/+v6FPs16bpne0
        UNEbNXww==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gUj5j-0003L7-Tz; Thu, 06 Dec 2018 02:08:40 +0000
Subject: Re: [PATCH v1 8/9] drm/doc: Add initial komeda driver documentation
To:     "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
        "corbet@lwn.net" <corbet@lwn.net>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        nd <nd@arm.com>
References: <20181205102522.7989-1-james.qian.wang@arm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ae6f05e0-d199-e9af-60c6-66fc73e3bf7b@infradead.org>
Date:   Wed, 5 Dec 2018 18:08:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181205102522.7989-1-james.qian.wang@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/5/18 2:25 AM, james qian wang (Arm Technology China) wrote:
> Signed-off-by: James (Qian) Wang <james.qian.wang@arm.com>
> ---
>  Documentation/gpu/drivers.rst    |   1 +
>  Documentation/gpu/komeda-kms.rst | 483 +++++++++++++++++++++++++++++++
>  2 files changed, 484 insertions(+)
>  create mode 100644 Documentation/gpu/komeda-kms.rst

Hi,

I have some editing changes for you to consider, although I did have a few
problems with reading the text.


> diff --git a/Documentation/gpu/komeda-kms.rst b/Documentation/gpu/komeda-kms.rst
> new file mode 100644
> index 000000000000..8af925ca0869
> --- /dev/null
> +++ b/Documentation/gpu/komeda-kms.rst
> @@ -0,0 +1,483 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==============================
> + drm/komeda ARM display driver
> +==============================
> +
> +The drm/komeda driver supports for the ARM display processor D71 and later

                  driver supports the ARM

> +IPs, this document is for giving a brief overview of driver design: how it

   IPs. This document gives a brief overview of the driver design:

(although I hate using "IPs" like that.)

> +works and why design it like that.
> +
> +Overview of D71 like display IPs
> +================================
> +
> +From D71, Arm display IP begins to adopt a flexible and modularized

             ARM

> +architecture. A display pipeline is made up of multiple individual and
> +functional pipeline stages called components, and every component has some
> +specific capabilities that can give the flowed pipeline pixel data a
> +particular processing.
> +
> +Typical D71 components:
> +
> +Layer
> +-----
> +Layer is the first pipeline stage, which is for preparing the pixel data
> +for the next stage. It fetches the pixel from memory, decodes it if it's
> +AFBC, rotates the source image, unpacks or converts YUV pixels to the device
> +internal RGB pixels, then adjust the color_space of pixels if need.

                             adjusts                          if needed.


> +
> +Scaler
> +------
> +As its name, scaler is taking responsability for scaling, and D71 also

  As its name suggests, scaler takes (or has) responsibility for

> +supports image enhancements by scaler.
> +The usage of scaler is very flexible and can be connected to layer output
> +for layer scaling, or connected to compositor and scale the whole display
> +frame and then feed the output data into wb_layer which will then write it
> +into memory.
> +
> +Compositor (compiz)
> +-------------------
> +Compositor is for blending multiple layers or pixel data flows into one
> +single display frame, and its output frame can be fed into post image
> +processor and then on the monitor or fed into wb_layer and written to memory
> +at the same time. And user also can insert a scaler between compositor and
> +wb_layer to down scale the display frame first and then writing to memory.

                                                  and then write to memory.

> +
> +Writeback Layer (wb_layer)
> +--------------------------
> +Writeback layer do the opposite things of Layer, Which connect to compiz and try

                   does                             which

> +to write the composition result to memory.
> +
> +Post image processor (improc)
> +-----------------------------
> +Post image processor is for adjusting frame data like gamma and color space
> +to fit the requirements of the monitor.
> +
> +Timing controller (timing_ctrlr)
> +--------------------------------
> +Final stage of display pipeline, Timing controller is not for the pixel
> +handling, but only for controlling the display timing.
> +
> +Merger
> +------
> +D71 scaler mostly only has half the horizontal input/output capabilities compare

                                                                            compared

> +with Layer, Like if Layer supports 4K input size, the scaler only can supports

               like                                                      support

> +2K input/output in some time. To achieve the fully frame scaling, D71 introduce

                                                full                     introduces

> +Layer Split, which split the whole image to two half part and feed them to two

                      splits                            parts and feeds

> +Layers A and B, and do the scaling independently, after scaling the result need

                       does           independently. After scaling the result needs

> +to be feed to merger to merge two part image, and then output to compiz.

         fed

> +
> +Splitter
> +--------
> +Similar to Layer Split, but Splitter is used for writeback, which split the

                                                                     splits

> +compiz result to two part and then feed them to two scaler.

                        parts and then feeds them to two scalers.

> +
> +Possible D71 Pipeline usage
> +===========================
> +
> +Benefit from the modularized architecture, D71 pipelines can be easily adjusted

  Benefitting from

> +to fit different usages, following are some typical pipeline data flow

                    usages. Following

> +configurations:
> +
> +Single pipeline data flow
> +-------------------------
> +
> +.. kernel-render:: DOT
> +   :alt: Single pipeline digraph
> +   :caption: Single pipeline data flow
> +
> +   digraph single_ppl {
> +      rankdir=LR;
> +
> +      subgraph {
> +         "Memory";
> +         "Monitor";
> +      }
> +
> +      subgraph cluster_pipeline {
> +          style=dashed
> +          node [shape=box]
> +          {
> +              node [bgcolor=grey style=dashed]
> +              "Scaler-0";
> +              "Scaler-1";
> +              "Scaler-0/1"
> +          }
> +
> +         node [bgcolor=grey style=filled]
> +         "Layer-0" -> "Scaler-0"
> +         "Layer-1" -> "Scaler-0"
> +         "Layer-2" -> "Scaler-1"
> +         "Layer-3" -> "Scaler-1"
> +
> +         "Layer-0" -> "Compiz"
> +         "Layer-1" -> "Compiz"
> +         "Layer-2" -> "Compiz"
> +         "Layer-3" -> "Compiz"
> +         "Scaler-0" -> "Compiz"
> +         "Scaler-1" -> "Compiz"
> +
> +         "Compiz" -> "Scaler-0/1" -> "Wb_layer"
> +         "Compiz" -> "Improc" -> "Timing Controller"
> +      }
> +
> +      "Wb_layer" -> "Memory"
> +      "Timing Controller" -> "Monitor"
> +   }
> +
> +Dual pipeline with Slave enabled
> +--------------------------------
> +
> +If pipeline_B is free, D71 supports redirect its compositor output to

                          D71 supports redirecting

> +pipeline_A as an input of compositor of pipeline_A, then pipeline_B doesn't
> +have its output and work as a slave of pipeline_A.

confusing!

> +NOTE: Since the compiz component doesn't output alpha value, the slave pipeline
> +only can be used for bottom layers composition.
> +
> +.. kernel-render:: DOT
> +   :alt: Slave pipeline digraph
> +   :caption: Slave pipeline enabled data flow
> +
> +   digraph slave_ppl {
> +      rankdir=LR;
> +
> +      subgraph {
> +         "Memory";
> +         "Monitor";
> +      }
> +      node [shape=box]
> +      subgraph cluster_pipeline_slave {
> +          style=dashed
> +          label="Slave Pipeline_B"
> +          node [shape=box]
> +          {
> +              node [bgcolor=grey style=dashed]
> +              "Slave.Scaler-0";
> +              "Slave.Scaler-1";
> +          }
> +
> +         node [bgcolor=grey style=filled]
> +         "Slave.Layer-0" -> "Slave.Scaler-0"
> +         "Slave.Layer-1" -> "Slave.Scaler-0"
> +         "Slave.Layer-2" -> "Slave.Scaler-1"
> +         "Slave.Layer-3" -> "Slave.Scaler-1"
> +
> +         "Slave.Layer-0" -> "Slave.Compiz"
> +         "Slave.Layer-1" -> "Slave.Compiz"
> +         "Slave.Layer-2" -> "Slave.Compiz"
> +         "Slave.Layer-3" -> "Slave.Compiz"
> +         "Slave.Scaler-0" -> "Slave.Compiz"
> +         "Slave.Scaler-1" -> "Slave.Compiz"
> +      }
> +
> +      subgraph cluster_pipeline_master {
> +          style=dashed
> +          label="Master Pipeline_A"
> +          node [shape=box]
> +          {
> +              node [bgcolor=grey style=dashed]
> +              "Scaler-0";
> +              "Scaler-1";
> +              "Scaler-0/1"
> +          }
> +
> +         node [bgcolor=grey style=filled]
> +         "Layer-0" -> "Scaler-0"
> +         "Layer-1" -> "Scaler-0"
> +         "Layer-2" -> "Scaler-1"
> +         "Layer-3" -> "Scaler-1"
> +
> +         "Slave.Compiz" -> "Compiz"
> +         "Layer-0" -> "Compiz"
> +         "Layer-1" -> "Compiz"
> +         "Layer-2" -> "Compiz"
> +         "Layer-3" -> "Compiz"
> +         "Scaler-0" -> "Compiz"
> +         "Scaler-1" -> "Compiz"
> +
> +         "Compiz" -> "Scaler-0/1" -> "Wb_layer"
> +         "Compiz" -> "Improc" -> "Timing Controller"
> +      }
> +
> +      "Wb_layer" -> "Memory"
> +      "Timing Controller" -> "Monitor"
> +   }
> +
> +Sub-pipelines for input and output
> +----------------------------------
> +
> +A complete display pipeline can be easily dividied into three sub-pipelines

                                             divided

> +according to the in/out usage.
> +
> +Layer(input) pipeline
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-render:: DOT
> +   :alt: Layer data digraph
> +   :caption: Layer (input) data flow
> +
> +   digraph layer_data_flow {
> +      rankdir=LR;
> +      node [shape=box]
> +
> +      {
> +         node [bgcolor=grey style=dashed]
> +           "Scaler-n";
> +      }
> +
> +      "Layer-n" -> "Scaler-n" -> "Compiz"
> +   }
> +
> +.. kernel-render:: DOT
> +   :alt: Layer Split digraph
> +   :caption: Layer Split pipeline
> +
> +   digraph layer_data_flow {
> +      rankdir=LR;
> +      node [shape=box]
> +
> +      "Layer-0/1" -> "Scaler-0" -> "Merger"
> +      "Layer-2/3" -> "Scaler-1" -> "Merger"
> +      "Merger" -> "Compiz"
> +   }
> +
> +Writeback(output) pipeline
> +~~~~~~~~~~~~~~~~~~~~~~~~~~
> +.. kernel-render:: DOT
> +   :alt: writeback digraph
> +   :caption: Writeback(output) data flow
> +
> +   digraph writeback_data_flow {
> +      rankdir=LR;
> +      node [shape=box]
> +
> +      {
> +         node [bgcolor=grey style=dashed]
> +           "Scaler-n";
> +      }
> +
> +      "Compiz" -> "Scaler-n" -> "Wb_layer"
> +   }
> +
> +.. kernel-render:: DOT
> +   :alt: split writeback digraph
> +   :caption: Writeback(output) Split data flow
> +
> +   digraph writeback_data_flow {
> +      rankdir=LR;
> +      node [shape=box]
> +
> +      "Compiz" -> "Splitter"
> +      "Splitter" -> "Scaler-0" -> "Merger"
> +      "Splitter" -> "Scaler-1" -> "Merger"
> +      "Merger" -> "Wb_layer"
> +   }
> +
> +Display output pipeline
> +~~~~~~~~~~~~~~~~~~~~~~~
> +.. kernel-render:: DOT
> +   :alt: display digraph
> +   :caption: display output data flow
> +
> +   digraph single_ppl {
> +      rankdir=LR;
> +      node [shape=box]
> +
> +      "Compiz" -> "Improc" -> "Timing Controller"
> +   }
> +
> +In the following section we'll see these three sub-pipelines will be handled
> +by KMS-plane/wb_conn/crtc respectively.
> +
> +Komeda Resource abstraction
> +===========================
> +
> +struct komeda_pipeline/component
> +--------------------------------
> +
> +To fully utilize and easily access/configure the HW, driver side also use a

                                                        the driver side also uses a

> +similar architecture: Pipeline/Component to describe the HW features and
> +capabilities. and a specific component includes two part:

   capabilities,                                       parts:

> +
> +-  Data flow controlling.
> +-  Specific component capabilities and features.
> +
> +So driver defines common header struct komeda_component to describe the data

   So the driver defines a common header

> +flow controlling. and all specific component are subclass of this base structure.

   flow control and all specific components are a subclass of

> +
> +.. kernel-doc:: drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
> +   :internal:
> +
> +Resource discovery and initialization
> +=====================================
> +
> +Pipeline and component are used to describe how to handle the pixel data.
> +We still need a @struct komeda_dev to describe the whole view of the device, and
> +the control-abilites of device.
> +
> +Now we have &komeda_dev, &komeda_pipeline, &komeda_component, but how to fill dev

Maybe:
   We have &komeda_dev, &komeda_pipeline, and &komeda_component. Now to fill the device

> +with pipelines. Since komeda is not only for D71 but also intended for later IPs,
> +of course we’d better share as much as possible between different IPs, to

                                                           different IPs. To

> +achieve it split komeda device into two layers: CORE and CHIP.

   achieve this, split the

> +
> +-   CORE: for common features and capabilities handling.
> +-   CHIP: for register program and HW specific feature (limitition) handling.

                                                          (limitation)

> +
> +CORE access to CHIP by three chip func:

   CORE can access CHIP by three chip function structures:

> +
> +-   struct komeda_dev_funcs
> +-   struct komeda_pipeline_funcs
> +-   struct komeda_component_funcs
> +
> +.. kernel-doc:: drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> +   :internal:
> +
> +Format handling
> +===============
> +
> +.. kernel-doc:: drivers/gpu/drm/arm/display/komeda/komeda_format_caps.h
> +   :internal:
> +.. kernel-doc:: drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
> +   :internal:
> +
> +Attach komeda_dev to DRM-KMS
> +============================
> +
> +Komeda abstracts resources by pipeline/component, but DRM-KMS uses
> +crtc/plane/connector. one KMS-obj can not represent only one single component,

                         One         cannot [preferably]

> +since the requirements of a single KMS object cannot simply be achieved by a
> +single component, usually that needs multiple components to fit the requirement.
> +Like set mode, gamma, ctm for KMS all target on CRTC-obj, but komeda needs
> +compiz, improc and timing_ctrlr to work together to fit these requirements.
> +And a KMS-Plane may requires multiple komeda resources: layer/scaler/compiz.

                       require

> +
> +So, One KMS-Obj represents a sub-pipeline of komeda resources.

       one

> +
> +-   Plane: `Layer(input) pipeline`_
> +-   Wb_connector: `Writeback(output) pipeline`_
> +-   Crtc: `Display output pipeline`_
> +
> +So, for komeda, we treat KMS crtc/plane/connector as users of pipeline and
> +component, and one time a pipeline/component only can be used by one user.

              and at any one time

> +And pipeline/component will be treated as private object of DRM-KMS, the state

                                                            of DRM-KMS; the state

> +will be managed drm_atomic_state as well.

   will be managed by drm_atomic_state as well.

> +
> +How to map plane to Layer(input) pipeline
> +-----------------------------------------
> +
> +Komeda has mutiple Layer input pipelines, see:
> +-   `Single pipeline data flow`_
> +-   `Dual pipeline with Slave enabled`_
> +
> +the easist way is binding a plane to a fixed Layer pipeline. but consider the

   The easiest                                        pipeline,


> +komeda capabilities:
> +
> +-   Layer Split, See `Layer(input) pipeline`_
> +
> +    Which actually handles a image by two Layer pipelines. if one plane only

                                                              If

> +    represents a fixed Layer, then the Layer_Split need to be handled in user

                                                      needs

> +    mode, for configure the pipeline as Layer_Split, user need to so much

       mode: to configure the pipeline as Layer_Split, the user needs much

> +    details of HW, and pass down lots of private properties.

       detail of the HW, and must pass down lots of private properties.

> +    But if handle it in kernel the logic will be smooth and simple.

       But if handled in the kernel, the logic will be smooth and simple.

So above, I tried to write what I thought you meant, but saying that Layer_Split
needs to be handled in user mode ... and then saying that if it is handled in the
kernel, it would be smooth and simple -- that seems to be contradictory to me,
so I guess I didn't understand it very well.

> +
> +-   Slave pipeline, See `Dual pipeline with Slave enabled`_
> +
> +    Since the compiz component doesn't output alpha value, the slave pipeline
> +    only can be used for bottom layers composition, komeda driver wants to hide

                                          composition. The komeda driver wants to hide

> +    this limitation to user, the way is pickup suitable Layer according to

                       to the user. The way to do this is to pick a suitable Layer
       according to Plane->zpos.

> +    Plane->zpos.
> +
> +    Slave pipeline capabilities of komeda also means the plane in komeda is CRTC
> +    shareable. assign real Layer to plane in kernal according to the real HW

                  Assign                        kernel

> +    usage and state can also easy the user driver for the sharable plane.

                                ??confused!!                 shareable

> +
> +So for komeda, the KMS-plane doesn't represent a fixed komeda layer pipeline,
> +but mutiple Layers with same capabilities, komeda will select one or more Layers

       multiple                 capabilities.
> +to fit the requirement of one KMS-plane.
> +
> +Make component/pipeline to be drm_private_obj
> +---------------------------------------------
> +
> +Add :c:type:`drm_private_obj` to :c:type:`komeda_component`, :c:type:`komeda_pipeline`
> +
> +.. code-block:: c
> +
> +    struct komeda_component {
> +        struct drm_private_obj obj;
> +        …

Prefer ASCII "...".

> +    }
> +
> +    struct komeda_pipeline {
> +        struct drm_private_obj obj;
> +        …

same.

> +    }
> +
> +Tracking component_state/pipeline_state by drm_atomic_state
> +-----------------------------------------------------------
> +
> +Add :c:type:`drm_private_state` and user to :c:type:`komeda_component_state`,
> +:c:type:`komeda_pipeline_state`
> +
> +.. code-block:: c
> +
> +    struct komeda_component_state {
> +        struct drm_private_state obj;
> +        void *binding_user;
> +        …

same.

> +    }
> +
> +    struct komeda_pipeline_state {
> +        struct drm_private_state obj;
> +        struct drm_crtc *crtc;
> +        ...

like that :)

> +    }
> +
> +komeda component validation
> +---------------------------
> +
> +Komeda has multiple types of components, but the process of validation are

                                                                          is

> +similar, usually include following steps:

                    including the following steps:

> +
> +.. code-block:: c
> +
> +    int komeda_xxxx_validate(struct komeda_component_xxx xxx_comp,
> +                struct komeda_component_output *input_dflow,
> +                struct drm_plane/crtc/connector *user,
> +                struct drm_plane/crtc/connector_state, *user_state)
> +    {
> +         setup 1: check if component is needed, like the scaler is optional depend

                                                                               depending

> +                  on the user_state, if unneeded, just return, the caller will put

                            user_state; if unneeded, just return, and the caller will put

> +                  the data flow into next stage.
> +         Setup 2: check user_state with component features and capabilities to see
> +                  if can meet, if not return fail.

                     if requirements can be met; if not, return fail.

> +         Setup 3: get component_state from drm_atomic_state, and try set user to

                                                                    try to set

> +                  component, fail if component has been assigned to another user already.

                     component;

> +         Setup 3: configure the component_state, like set its input component,
> +                  convert user_state to component specific state.
> +         Setup 4: adjust the input_dflow and prepare it for the next stage.
> +    }
> +
> +komeda_kms Abstraction
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> +   :internal:
> +
> +komde_kms Functions
> +-------------------
> +.. kernel-doc:: drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +   :internal:
> +.. kernel-doc:: drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> +   :internal:
> +
> +Build komeda to be a linux module driver

                        Linux

> +========================================
> +
> +Now we have two devices:
> +
> +-   komeda_dev is for describing the real display hardware.
> +-   komeda_kms_dev is for attaching or connecting komeda_dev to DRM-KMS.
> +
> +all komeda operations are supplied or operated by komeda_dev or komeda_kms_dev,

   All

> +the module driver is only a simple wrapper to pass the linux command

                                                          Linux

> +(probe/remove/pm) into komeda_dev or komeda_kms_dev.
> 

HTH.
-- 
~Randy
